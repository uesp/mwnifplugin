/*===========================================================================
 *
 * File:	Nifimport.CPP
 * Author:	Dave Humphrey (uesp@m0use.net)
 * Created On:	Tuesday, December 23, 2003
 *
 * Description
 *
 *=========================================================================*/

	/* Include Files */
#include "stdafx.h"
#include "nifimport.h"


/*===========================================================================
 *
 * Begin Local Definitions
 *
 *=========================================================================*/
  DEFINE_FILE("NifImport.cpp");

  static CNifClassDesc s_ClassDesc;
  static bool g_ShowPrompts = true;

  ImpInterface* CNifImport::m_pImpInt = NULL;
/*===========================================================================
 *		End of Local Definitions
 *=========================================================================*/


/*===========================================================================
 *
 * Function - DWORD l_DummyCallback (arg);
 *
 * Local dummy thread function.
 *
 *=========================================================================*/
DWORD WINAPI l_DummyCallback (LPVOID arg) { 
  return (0);
 }
/*===========================================================================
 *		End of Function WINAPI l_DummyCallback()
 *=========================================================================*/


/*===========================================================================
 *
 * Function - bool CompareMaterials (pMaterial1, pMaterial2);
 *
 * Compares two materials returning true if they are considered the same.
 *
 *=========================================================================*/
bool CompareMaterials (StdMat2* pMaterial1, StdMat2* pMaterial2) {
  //DEFINE_FUNCTION("CompareMaterials()");
  BitmapTex* pMap1;
  BitmapTex* pMap2;

	/* Ignore invalid input */
  if (pMaterial1 == NULL || pMaterial2 == NULL) return (false);

	/* Check material names (case insensitive) */
  if (stricmp(pMaterial1->GetName(), pMaterial2->GetName()) != 0) return (false);

	/* Check existence of submaps */
  if (pMaterial1->MapEnabled(ID_DI) != pMaterial2->MapEnabled(ID_DI)) return (false);
  if (pMaterial1->MapEnabled(ID_OP) != pMaterial2->MapEnabled(ID_OP)) return (false);

	/* Compare diffuse map */
  if (pMaterial1->MapEnabled(ID_DI)) {
     pMap1 = (BitmapTex *) pMaterial1->GetSubTexmap(ID_DI);
     pMap2 = (BitmapTex *) pMaterial2->GetSubTexmap(ID_DI);
     if (pMap1 == NULL || pMap2 == NULL) return (false);

		/* Compare map texture filename */
     if (TSTRICMP(pMap1->GetMapName(), pMap2->GetMapName()) != 0) return (false);
   }

	/* Compare diffuse map */
  if (pMaterial1->MapEnabled(ID_OP)) {
     pMap1 = (BitmapTex *) pMaterial1->GetSubTexmap(ID_OP);
     pMap2 = (BitmapTex *) pMaterial2->GetSubTexmap(ID_OP);
     if (pMap1 == NULL || pMap2 == NULL) return (false);

		/* Compare map texture filename */
     if (TSTRICMP(pMap1->GetMapName(), pMap2->GetMapName()) != 0) return (false);
   }

	/* Compare basic material properties */
  if (pMaterial1->GetAmbient(0)   != pMaterial2->GetAmbient(0))   return (false);
  if (pMaterial1->GetDiffuse(0)   != pMaterial2->GetDiffuse(0))   return (false);
  if (pMaterial1->GetSpecular(0)  != pMaterial2->GetSpecular(0))  return (false);
  if (pMaterial1->GetOpacity(0)   != pMaterial2->GetOpacity(0))   return (false);
  if (pMaterial1->GetShinStr(0)   != pMaterial2->GetShinStr(0))   return (false);
  if (pMaterial1->GetShininess(0) != pMaterial2->GetShininess(0)) return (false);
  if (pMaterial1->GetSelfIllum(0) != pMaterial2->GetSelfIllum(0)) return (false);
  
	/* Materials are identical for our purposes */
  return (true);
 }
/*===========================================================================
 *		End of Function CompareMaterials()
 *=========================================================================*/


/*===========================================================================
 *
 * Function - int AttachNode (pParent, pChild);
 *
 * Local function to help attach two scene nodes.
 *
 *=========================================================================*/
bool AttachNode (ImpNode* pParent, ImpNode* pChild) {
  INode* pParentINode;
  INode* pINode;

	/* Ignore invalid input */
  if (pParent == NULL || pChild == NULL || pParent == pChild) return (true);

	/* Get the required INode objects */
  pParentINode = pParent->GetINode();
  pINode       = pChild->GetINode();

	/* Attach the objects */
  pParentINode->AttachChild(pINode);
    
  return (true);
 }
/*===========================================================================
 *		End of Function AttachNode()
 *=========================================================================*/


/*===========================================================================
 *
 * Function - bool AssignMaterial (pSceneNode, pMaterial);
 *
 * Local function to help assign a material to a scene node.
 *
 *=========================================================================*/
bool AssignMaterial (ImpNode* pSceneNode, StdMat2* pMaterial) {
  INode* pINode;

	/* Ignore invalid input */
  if (pMaterial == NULL || pSceneNode == NULL) return (true);

  pINode = pSceneNode->GetINode();
  if (pINode != NULL) pINode->SetMtl(pMaterial);

  return (true);
 }
/*===========================================================================
 *		End of Function AssignMaterial()
 *=========================================================================*/


/*===========================================================================
 *
 * Function - int CreateBox (MeshObject, Size);
 *
 * Creates a simple box with the given mesh object.
 *
 *=========================================================================*/
int CreateBox (Mesh& MeshObject, const float Size) {

  MeshObject.setNumVerts(8);
  MeshObject.setNumFaces(12);
  MeshObject.setVert(0, 0, 0, 0);
  MeshObject.setVert(1, Size, 0, 0);
  MeshObject.setVert(2, Size, Size, 0);
  MeshObject.setVert(3, 0, Size, 0);
  MeshObject.setVert(4, 0, 0, Size);
  MeshObject.setVert(5, Size, 0, Size);
  MeshObject.setVert(6, Size, Size, Size);
  MeshObject.setVert(7, 0, Size, Size);
  MeshObject.faces[0].setVerts(0, 2, 1);
  MeshObject.faces[1].setVerts(0, 3, 2);
  MeshObject.faces[2].setVerts(0, 7, 4);
  MeshObject.faces[3].setVerts(0, 3, 7);
  MeshObject.faces[4].setVerts(0, 1, 5);
  MeshObject.faces[5].setVerts(0, 5, 4);
  MeshObject.faces[6].setVerts(3, 2, 6);
  MeshObject.faces[7].setVerts(3, 6, 7);
  MeshObject.faces[8].setVerts(1, 2, 6);
  MeshObject.faces[9].setVerts(1, 6, 5);
  MeshObject.faces[10].setVerts(4, 5, 6);
  MeshObject.faces[11].setVerts(4, 6, 7);
 
  return (IMPEXP_SUCCESS);
 }
/*===========================================================================
 *		End of Function CreateBox()
 *=========================================================================*/


/*===========================================================================
 *
 * Function - Matrix3 CreateTransformMatrix (pArray);
 *
 * Create and return a Matrix3 transformation matrix from the given array
 * of floats from a NiNode or NiTriShape NIF record.
 *
 *=========================================================================*/
Matrix3 CreateTransformMatrix (const float* pArray) {
  //DEFINE_FUNCTION("CreateTransformMatrix()");
  Matrix3	TransformMatrix;
  Quat		TempQuat;
  Point3	UPoint;
  Point3	VPoint;
  Point3	NPoint;
  Point3	TPoint;

	/* Set the transform points */
  UPoint.x = pArray[3];
  UPoint.y = pArray[4];
  UPoint.z = pArray[5];
  VPoint.x = pArray[6];
  VPoint.y = pArray[7];
  VPoint.z = pArray[8];
  NPoint.x = pArray[9];
  NPoint.y = pArray[10];
  NPoint.z = pArray[11];
  TPoint.x = pArray[0];
  TPoint.y = pArray[1];
  TPoint.z = pArray[2];

 /* UPoint.x = pArray[11];
  UPoint.y = pArray[10];
  UPoint.z = pArray[9];
  VPoint.x = pArray[8];
  VPoint.y = pArray[7];
  VPoint.z = pArray[6];
  NPoint.x = pArray[5];
  NPoint.y = pArray[4];
  NPoint.z = pArray[3];
  TPoint.x = pArray[0];
  TPoint.y = pArray[1];
  TPoint.z = pArray[2]; //*/

  TransformMatrix.SetRow(0, UPoint);
  TransformMatrix.SetRow(1, VPoint);
  TransformMatrix.SetRow(2, NPoint);
  TransformMatrix.SetRow(3, TPoint);

	/* Change the handed-ness of the transform matrix */
  TempQuat.Set(TransformMatrix);
  TempQuat.MakeMatrix(TransformMatrix, TRUE);
  TransformMatrix.SetRow(3, TPoint);

  return (TransformMatrix);
 }
/*===========================================================================
 *		End of Function CreateTransformMatrix()
 *=========================================================================*/


/*===========================================================================
 *
 * Begin Exported Functions
 *
 *=========================================================================*/

	/* Return a short description of the library */
__declspec(dllexport) const TCHAR* LibDescription() { 
  return _T("NIF Import Plugin"); 
 }


	/* Return the number of classes defined */
__declspec(dllexport) int LibNumberClasses() { 
  return 1;
 }


	/* Access the description of the defined classes */
__declspec(dllexport) ClassDesc* LibClassDesc(int i) {
  switch(i) {
    case 0:  return &s_ClassDesc; break;
    default: return 0; break;
   }
  }


	/* Return version so can detect obsolete DLLs */
__declspec(dllexport) ULONG LibVersion() { 
  return VERSION_3DSMAX; 
 }


	/* Let the plug-in register itself for deferred loading */
__declspec(dllexport) ULONG CanAutoDefer() {
  return 1;
 }
/*===========================================================================
 *		End of Exported Functions
 *=========================================================================*/


/*===========================================================================
 *
 * Class CNifImport Constructor
 *
 *=========================================================================*/
CNifImport::CNifImport () {
  //DEFINE_FUNCTION("CNifImport::CNifImport()");
  m_pInterface = NULL;
 }
/*===========================================================================
 *		End of Class CNifImport Constructor
 *=========================================================================*/


/*===========================================================================
 *
 * Class CNifImport Method - void Destroy (void);
 *
 *=========================================================================*/
void CNifImport::Destroy (void) {
  //DEFINE_FUNCTION("CNifImport::Destroy()");
  m_NifFile.Destroy();
 }
/*===========================================================================
 *		End of Class Method CNifImport::Destroy()
 *=========================================================================*/


/*===========================================================================
 *
 * Class CNifImport Method - int ExtCount ();
 *
 * Returns the number of extensions defined. Pure virtual overload.
 *
 *=========================================================================*/
int CNifImport::ExtCount() {
  return (1);
 }
/*===========================================================================
 *		End of Class Method CNifImport::ExtCount()
 *=========================================================================*/


/*===========================================================================
 *
 * Class TCHAR* CNifImport Method - const Ext (ExtIndex);
 *
 * Returns the specified extension string. Pure virtual overload.
 *
 *=========================================================================*/
const TCHAR* CNifImport::Ext (int ExtIndex) { 

  switch (ExtIndex) {
    case 0:  return _T("Nif");
    default: return _T("");
   }
 }
/*===========================================================================
 *		End of Class Method TCHAR* CNifImport::Ext()
 *=========================================================================*/


/*===========================================================================
 *
 * Class TCHAR* CNifImport Method - const LongDesc ();
 *
 * Long description of the plugin. Pure virtual overload.
 *
 *=========================================================================*/
const TCHAR* CNifImport::LongDesc () {
  return _T("NIF v3.0 Importer");
 }
/*===========================================================================
 *		End of Class Method TCHAR* CNifImport::LongDesc()
 *=========================================================================*/


/*===========================================================================
 *
 * Class TCHAR* CNifImport Method - const ShortDesc ();
 *
 * Return a short description of the plugin. Pure virtual overload.
 *
 *=========================================================================*/
const TCHAR* CNifImport::ShortDesc () {
  return _T("NIF Import");
 }
/*===========================================================================
 *		End of Class Method TCHAR* CNifImport::ShortDesc()
 *=========================================================================*/


/*===========================================================================
 *
 * Class TCHAR* CNifImport Method - const AuthorName ();
 *
 * Returns the author of the plugin. Pure virtual method.
 *
 *=========================================================================*/
const TCHAR* CNifImport::AuthorName () {
  return _T("Dave Humphrey, uesp@sympatico.ca");
 }
/*===========================================================================
 *		End of Class Method TCHAR* CNifImport::AuthorName()
 *=========================================================================*/


/*===========================================================================
 *
 * Class TCHAR* CNifImport Method - const CopyrightMessage ();
 *
 * Returns the copyright message for the plugin. Pure virtual overload.
 *
 *=========================================================================*/
const TCHAR* CNifImport::CopyrightMessage () {
  return _T("Copyright (c) 2003");
 }
/*===========================================================================
 *		End of Class Method TCHAR* CNifImport::CopyrightMessage()
 *=========================================================================*/


/*===========================================================================
 *
 * Class TCHAR* CNifImport Method - const OtherMessage1 ();
 *
 * Return other message strings. Pure virtual overload.
 *
 *=========================================================================*/
const TCHAR* CNifImport::OtherMessage1 () {
  return _T("");
 }


const TCHAR* CNifImport::OtherMessage2 () {
  return _T("");
 }
/*===========================================================================
 *		End of Class Method TCHAR* CNifImport::OtherMessage1()
 *=========================================================================*/


/*===========================================================================
 *
 * Class int CNifImport Method - unsigned Version ();
 *
 * Return the plugin's version x100. Pure virtual overload.
 *
 *=========================================================================*/
unsigned int CNifImport::Version () {
  return (010);
 }
/*===========================================================================
 *		End of Class Method int CNifImport::Version()
 *=========================================================================*/


/*===========================================================================
 *
 * Class CNifImport Method - void ShowAbout (hWnd);
 *
 * Show the plugin's about box (optional). Pure virtual overload.
 *
 *=========================================================================*/
void CNifImport::ShowAbout (HWND hWnd) {
 }
/*===========================================================================
 *		End of Class Method CNifImport::ShowAbout()
 *=========================================================================*/


/*===========================================================================
 *
 * Class CNifImport Method - bool CreateMeshFaces (pMesh, pTriShapeData);
 *
 * Adds the face data from the TriShapeData record to the mesh object.
 * Returns false on any error. Protected class method.
 *
 *=========================================================================*/
bool CNifImport::CreateMeshFaces (Mesh* pMesh, CNifTriShapeData* pTriShapeData) {
  bool		HasTexture = pTriShapeData->HasTexture();
  short*	pFaceIndex;
  int		Result;
  int		Index;

	/* Initialize the face data */
  Result = pMesh->setNumFaces(pTriShapeData->GetNumFaces(), FALSE);
  if (HasTexture) pMesh->setNumTVFaces(pTriShapeData->GetNumFaces(), FALSE);
  if (!Result) return (false);

	/* Set all faces in the shape */
  for (Index = 0; Index < pTriShapeData->GetNumFaces(); Index++) {
    pFaceIndex = pTriShapeData->GetFace(Index*3);
    pMesh->faces[Index].v[0] = pFaceIndex[0];
    pMesh->faces[Index].v[1] = pFaceIndex[1];
    pMesh->faces[Index].v[2] = pFaceIndex[2];
    pMesh->faces[Index].Show();
    pMesh->faces[Index].setEdgeVisFlags(EDGE_VIS, EDGE_VIS, EDGE_VIS);

		/* Set the UV face information if present */
    if (HasTexture) {
      pMesh->tvFace[Index].t[0] = pFaceIndex[0];
      pMesh->tvFace[Index].t[1] = pFaceIndex[1];
      pMesh->tvFace[Index].t[2] = pFaceIndex[2];
     }
   }

  return (true);
 }
/*===========================================================================
 *		End of Class Method CNifImport::CreateMeshFaces()
 *=========================================================================*/


/*===========================================================================
 *
 * Class CNifImport Method - bool CreateMeshNormals (pMesh, pTriShapeData);
 *
 * Adds the points data from the TriShapeData record to the mesh object.
 * Returns false on any error. Protected class method.
 *
 *=========================================================================*/
bool CNifImport::CreateMeshNormals (Mesh* pMesh, CNifTriShapeData* pTriShapeData) {
  bool		HasTexture = pTriShapeData->HasTexture();
  nifpos_t*	pPoint;
  Point3	NormPoint;
  int		Index;

	/* Update the default normal arrays for the object */
  SystemLog.Printf(_T("\tCreating Mesh Normals..."));
  //pMesh->buildNormals();
  //pMesh->buildRenderNormals();
  pMesh->checkNormals(TRUE);
  pMesh->AutoSmooth((float)M_PI, FALSE, FALSE);

	/* Assign the normals information from the TriShapeData */
  for (Index = 0; Index < pTriShapeData->GetNumPoints(); Index++) {
    pPoint = pTriShapeData->GetNormal(Index);

    if (pPoint != NULL) {
      NormPoint.x = pPoint->X;
      NormPoint.y = pPoint->Y;
      NormPoint.z = pPoint->Z;
      pMesh->setNormal(Index, NormPoint);
     }
    else {
      SystemLog.Printf(_T("\t\tBad Normal Index %d!"), Index);
     }
   }

/*
  for (Index = 0; Index < pTriShapeData->GetNumFaces(); Index++) {
    pMesh->setFaceNormal(Index, Point3(0,1,0));
   } //*/

  //pMesh->buildRenderNormals();
  return (true);
 }
/*===========================================================================
 *		End of Class Method CNifImport::CreateMeshNormals()
 *=========================================================================*/


/*===========================================================================
 *
 * Class CNifImport Method - bool CreateMeshPoints (pMesh, pTriShapeData);
 *
 * Adds the points data from the TriShapeData record to the mesh object.
 * Returns false on any error. Protected class method.
 *
 *=========================================================================*/
bool CNifImport::CreateMeshPoints (Mesh* pMesh, CNifTriShapeData* pTriShapeData) {
  bool		HasTexture = pTriShapeData->HasTexture();
  nifpos_t*	pPoint;
  float*	pUVPoint;
  int		Result;
  int		Index;

	/* Initialize the vertices in the object */
  Result = pMesh->setNumVerts(pTriShapeData->GetNumPoints(), FALSE);
  if (HasTexture) pMesh->setNumTVerts(pTriShapeData->GetNumPoints(), FALSE);
  if (!Result) return (false);

	/* Add each vertex, and UV vertex, to the mesh */
  for (Index = 0; Index < pTriShapeData->GetNumPoints(); Index++) {
    pPoint   = pTriShapeData->GetPoint(Index);
    pUVPoint = pTriShapeData->GetUVPointPtr(Index);
    pMesh->verts[Index].x = pPoint->X;
    pMesh->verts[Index].y = pPoint->Y;
    pMesh->verts[Index].z = pPoint->Z;

		/* Add the UV vertex information if present */
    if (HasTexture && pUVPoint != NULL) {
      pMesh->tVerts[Index].x = pUVPoint[0];
      pMesh->tVerts[Index].y = -pUVPoint[1];
      pMesh->tVerts[Index].z = 0;
     }
   }

  return (true);
 }
/*===========================================================================
 *		End of Class Method CNifImport::CreateMeshPoints()
 *=========================================================================*/


/*===========================================================================
 *
 * Class CNifImport Method - bool CreateVertexColors (pMesh, pTriShapeData);
 *
 * Assigns the vertex color data from the TriShapeData record to the 
 * mesh object. Returns false on any error. Protected class method.
 *
 *=========================================================================*/
bool CNifImport::CreateVertexColors (Mesh* pMesh, CNifTriShapeData* pTriShapeData) {
  bool		HasTexture = pTriShapeData->HasTexture();
  nifcolor4_t*	pPoint;
  int		Index;

	/* Ignore invalid input */
  if (pTriShapeData->GetVertexColors() == NULL) return (true);
  SystemLog.Printf(_T("\t\t\tSetting Vertex Colors..."));

	/* Set the number of color vertices */
  pMesh->setNumVertCol(pTriShapeData->GetNumPoints(), FALSE);

	/* Set each vertex color */
  for (Index = 0; Index < pTriShapeData->GetNumPoints(); Index++) {
    pPoint = &pTriShapeData->GetVertexColors()[Index];
    pMesh->vertCol[Index].x = pPoint->R;
    pMesh->vertCol[Index].y = pPoint->G;
    pMesh->vertCol[Index].z = pPoint->B;
   }

  return (true);
 }
/*===========================================================================
 *		End of Class Method CNifImport::CreateVertexColors()
 *=========================================================================*/


/*===========================================================================
 *
 * Class CNifImport Method - Material* CreateMaterial (pTriShape);
 *
 * Protected class method that attempts to create a material object from
 * the given TriShape record. Returns NULL if there is no material or an
 * error occurred.
 *
 *=========================================================================*/
StdMat2* CNifImport::CreateMaterial (CNifTriShape* pTriShape) {
  CNifLongArray*  pMaterialArray = pTriShape->GetMaterialArray();
  CNifBaseRecord* pRecord;
  StdMat2*	  pMaterial;
  StdMat2*	  pMaterial2;
  bool		  Result;
  int		  Index;

	/* Try and find an existing material in the library */
	/* NOTE: We can't do this as materials with the same name in the
	   NIF can actually be different from each other */
  /* pMaterial = FindMaterial(pTriShape);
  if (pMaterial != NULL) return (pMaterial); */
  	
	/* Create the new material */
  pMaterial = NewDefaultStdMat();

	/* Set the basic material options */
  pMaterial->SetMtlFlag(MTL_TEX_DISPLAY_ENABLED, TRUE);

	/* Iterate through all material records referenced by the TriShape */
  for (Index = 0; Index < pMaterialArray->GetSize(); Index++) {
    pRecord = m_NifFile.GetRecord(pMaterialArray->GetAt(Index));
    if (pRecord == NULL) continue;
    SystemLog.Printf(_T("\t\tMaterial SubRecord '%s', 0x%08lX"), pRecord->GetName(), pRecord->GetStartOffset());
    
		/* Determine the type of material record */
    if (pRecord->IsName(NIF_RECORD_MATERIALPROPERTY))
      Result = Result = ParseMaterialProperty(pMaterial, (CNifMaterialProperty *) pRecord);
    else if (pRecord->IsName(NIF_RECORD_TEXTURINGPROPERTY))
      Result = ParseTexturingProperty(pMaterial, (CNifTexturingProperty *) pRecord);
    else if (pRecord->IsName(NIF_RECORD_ALPHAPROPERTY))
      Result = ParseAlphaProperty(pMaterial, (CNifAlphaProperty *) pRecord); 
    else if (pRecord->IsName(NIF_RECORD_SPECULARPROPERTY))
      Result = ParseSpecularProperty(pMaterial, (CNifSpecularProperty *) pRecord); 
    else {
      SystemLog.Printf(_T("\t\t\tUnknown Material SubRecord Type!"));
      Result = true;
     }
   }

	/* Now that we've created the material, see if one like it is already
	 * in the material library for this object. If we find one we'll use
	 * it instead of the new one to reduce the number of created materials. */
  pMaterial2 = FindMaterial(pMaterial);

  if (pMaterial2 != NULL) {
    pMaterial->DeleteThis();
    return (pMaterial2);
   }

	/* Add the material to the material library */
  m_pInterface->GetMaterialLibrary().Add(pMaterial);
  return (pMaterial);
 }
/*===========================================================================
 *		End of Class Method CNifImport::CreateMaterial()
 *=========================================================================*/


/*===========================================================================
 *
 * Class CNifImport Method - int CreateScene (void);
 *
 * Takes the current NIF file and attempts to create the MAX scene with it.
 * Protected class methods.
 *
 *=========================================================================*/
int CNifImport::CreateScene (void) {
  //DEFINE_FUNCTION("CNifImport::CreateScene()");
  CNifNode*	  pNode;
  POSITION        NodePos;
  nifimpinfo_t	  ImportInfo;
  int		  Result;
  int		  Index = 0;

  	/* Update the progress bar */
  m_pInterface->ProgressUpdate(50, TRUE, _T("Creating Scene..."));

	/* Find the first node in the NIF file */
  pNode = (CNifNode *) m_NifFile.FindFirstRecord(NodePos, NIF_RECORD_NODE);

  if (pNode == NULL) {
    ErrorHandler.AddError(ERR_BADINPUT, _T("No Node found in NIF file!"));
    return (IMPEXP_FAIL);
   }

	/* Start the conversion with the root node in the file */
  Result = ParseNode(pNode, ImportInfo);
  return (Result);
 }
/*===========================================================================
 *		End of Class Method CNifImport::CreateScene()
 *=========================================================================*/


/*===========================================================================
 *
 * Class CNifImport Method - int DoImport (pFilename, pI, pGI, SuppressPrompts);
 *
 * Start the import process. Pure virtual overload.
 *
 *=========================================================================*/
int CNifImport::DoImport (const TCHAR* pFilename, ImpInterface* pI, Interface* pGI, BOOL SuppressPrompts) {
  int Result;

	/* Initialize class members */
  g_ShowPrompts = (SuppressPrompts == TRUE);
  m_pInterface  = pGI;
  m_pImpInt     = pI;

	/* Show the show the import progress */
  m_pInterface->ProgressStart(_T("Importing NIF"), TRUE, l_DummyCallback, 0);

	/* Do the import */
  Result = ImportNif(pFilename);
  //Result = IMPEXP_CANCEL;	

	/* Get rid of the progress bar */
  m_pInterface->ProgressEnd();
  return (Result <= 0 ? IMPEXP_FAIL : Result);
 }
/*===========================================================================
 *		End of Class Method CNifImport::DoImport()
 *=========================================================================*/


/*===========================================================================
 *
 * Class CNifImport Method - Material* FindMaterial (pTriShape);
 *
 * Protected class method that attempts to find a material from the material
 * library. Returns NULL if there is no matching material was found.
 *
 *=========================================================================*/
StdMat2* CNifImport::FindMaterial (CNifTriShape* pTriShape) {
  CNifLongArray*	pMaterialArray = pTriShape->GetMaterialArray();
  CNifBaseRecord*	pRecord;
  CNifMaterialProperty* pMaterialProp;
  int			Index;
  int			MatIndex;

	/* Look for the NiMaterialProperty record in the TriShape */
  for (Index = 0; Index < pMaterialArray->GetSize(); Index++) {
    pRecord = m_NifFile.GetRecord(pMaterialArray->GetAt(Index));
    if (pRecord == NULL) continue;
    if (pRecord->IsName(NIF_RECORD_MATERIALPROPERTY)) break;
   }

	/* No MaterialProperty record found! */
  if (Index >= pMaterialArray->GetSize()) {
    ErrorHandler.AddError(ERR_BADINPUT, _T("No material property found in trishape record '%s'!"), pTriShape->GetRecordName());
    return (NULL);
   }

	/* See if the material already exists in the library */
  pMaterialProp = (CNifMaterialProperty *) pRecord;
  MatIndex = m_pInterface->GetMaterialLibrary().FindMtlByName(TSTR(pMaterialProp->GetRecordName()));
  if (MatIndex != -1) return ((StdMat2 *) m_pInterface->GetMaterialLibrary()[MatIndex]);
   	
	/* No match found */
  return (NULL);
 }
/*===========================================================================
 *		End of Class Method CNifImport::FindMaterial()
 *=========================================================================*/


/*===========================================================================
 *
 * Class CNifImport Method - Material* FindMaterial (pMaterial);
 *
 * Protected class method that attempts to find a material from the material
 * library that matches the given material. Returns NULL if there is no 
 * matching material was found.
 *
 *=========================================================================*/
StdMat2* CNifImport::FindMaterial (StdMat2* pMaterial) {
  StdMat2* pMaterial2;
  bool	   Result;
  int	   Index;

  for (Index = 0; Index < m_pInterface->GetMaterialLibrary().Count(); Index++) {
    pMaterial2 = (StdMat2 *) m_pInterface->GetMaterialLibrary()[Index];
    Result = CompareMaterials(pMaterial, pMaterial2);
    if (Result) return (pMaterial2);
   }
   	
	/* No match found */
  return (NULL);
 }
/*===========================================================================
 *		End of Class Method CNifImport::FindMaterial()
 *=========================================================================*/


/*===========================================================================
 *
 * Class CNifImport Method - int ImportNif (pFilename);
 *
 * Main method to import the given NIF file. Protected class method.
 *
 *=========================================================================*/
int CNifImport::ImportNif (const TCHAR* pFilename) {
  //DEFINE_FUNCTION("CNifImport::ImportNif()");
  int Result;

  //return TestMesh1();

  m_pInterface->GetMaterialLibrary().DeleteAll();

	/* Attempt to load/parse the NIF file */
  Result = LoadNif(pFilename);
  if (Result != IMPEXP_SUCCESS) return (Result);

	/* Add the objects to the max scene */
  Result = CreateScene();
  if (Result != IMPEXP_SUCCESS) return (Result);
 
	/* Import was a success! */
  return (IMPEXP_SUCCESS);
 }
/*===========================================================================
 *		End of Class Method CNifImport::ImportNif()
 *=========================================================================*/


/*===========================================================================
 *
 * Class CNifImport Method - int LoadNif (pFilename);
 *
 * Protected class method to load/parse the given NIF file.
 *
 *=========================================================================*/
int CNifImport::LoadNif (const TCHAR* pFilename) {
  //DEFINE_FUNCTION("CNifImport::LoadNif()");
  bool Result;

	/* Update the progress bar */
  m_pInterface->ProgressUpdate(0, TRUE, _T("Loading NIF File..."));
  SystemLog.Printf(_T("\t\tLoading Nif '%s'..."), pFilename);

	/* Attempt to read and parse the given NIF file */
  Result = m_NifFile.Read(pFilename);
  SystemLog.Printf(_T("\t\tFinished Loading Nif"));

  if (!Result) {
    SystemLog.Printf(_T("\t\tNif Error!"));
    ErrorHandler.Notify(_T("Nif Load Error!"));
    return (IMPEXP_FAIL);
   }

  return (IMPEXP_SUCCESS);
 }
/*===========================================================================
 *		End of Class Method CNifImport::LoadNif()
 *=========================================================================*/


/*===========================================================================
 *
 * Class CNifImport Method - int ParseKeyFrame (pNode, ImportInfo);
 *
 * Parses any keyframe information for the given node.
 *
 *=========================================================================*/
int CNifImport::ParseKeyFrame (CNifNode* pNode, nifimpinfo_t& ImportInfo) {
  CNifBaseRecord* pKeyFrame;
  nifimpinfo_t	  NewImpInfo;
  int		  Result;

	/* See if the node has any keyframe information associated with it */
  pKeyFrame = m_NifFile.GetRecord(pNode->GetKeyFrameIndex());
  if (pKeyFrame == NULL) return (IMPEXP_SUCCESS);

	/* Ensure the record is the correct type */
  if (pKeyFrame->IsName(NIF_RECORD_KEYFRAMECONTROLLER)) {
    NewImpInfo = ImportInfo;
    Result = ParseKeyFrameController((CNifKeyFrameController *)pKeyFrame, NewImpInfo);
    return (Result);
   }

  	/* Unknown keyframe record type */
  ErrorHandler.AddError(ERR_BADINPUT, _T("Unknown keyframe controller record %s!"), pKeyFrame->GetName());
  return (IMPEXP_FAIL);
 }
/*===========================================================================
 *		End of Class Method CNifImport::ParseKeyFrame()
 *=========================================================================*/


/*===========================================================================
 *
 * Class CNifImport Method - int ParseKeyFrameController (pKeyFrameCtrl, ImportInfo);
 *
 * Parses a keyframe controller of a node.
 *
 *=========================================================================*/
int CNifImport::ParseKeyFrameController (CNifKeyFrameController* pKeyFrameCtrl, 
					 nifimpinfo_t& ImportInfo) {
  CNifBaseRecord* pKeyFrame;
  int		  Result;
  
	/* Ensure the keyframe record is valid */
  pKeyFrame = m_NifFile.GetRecord(pKeyFrameCtrl->GetKeyFrameIndex());

  if (pKeyFrame == NULL) {
    ErrorHandler.AddError(ERR_BADINPUT, _T("Keyframe controller has an invalid keyframe data index (%d)!"), pKeyFrameCtrl->GetKeyFrameIndex());
    return (IMPEXP_SUCCESS);
   }

	/* Ensure the keyframe data is the correct type */
  if (!pKeyFrame->IsName(NIF_RECORD_KEYFRAMEDATA)) {
    Result = ParseKeyFrameData((CNifKeyFrameData *) pKeyFrame, ImportInfo);
    return (Result);
   }

  	/* Unknown keyframe record type */
  ErrorHandler.AddError(ERR_BADINPUT, _T("Unknown keyframe data record %s!"), pKeyFrame->GetName());
  return (IMPEXP_FAIL);
 }
/*===========================================================================
 *		End of Class Method CNifImport::ParseKeyFrameController()
 *=========================================================================*/


/*===========================================================================
 *
 * Class CNifImport Method - int ParseKeyFrameData (pKeyFrameData, ImportInfo);
 *
 * Parse a single keyframe data record.
 *
 *=========================================================================*/
int CNifImport::ParseKeyFrameData (CNifKeyFrameData* pKeyFrameData, nifimpinfo_t& ImportInfo) {
  INode*	  pINode;
  Control*	  pControl;
  IKeyControl*	  pIKeys;

	/* Get the controller information */
  pINode   = ImportInfo.pParent->GetINode();
  pControl = pINode->GetTMController()->GetPositionController();
  pIKeys   = GetKeyControlInterface(pControl);
  return (IMPEXP_SUCCESS);
 }
/*===========================================================================
 *		End of Class Method CNifImport::ParseKeyFrameData()
 *=========================================================================*/


/*===========================================================================
 *
 * Class CNifImport Method - int ParseNode (pNode, ImportInfo);
 *
 * Protected class method to parse a NIF node record. Adds a node to the
 * scene and iterates through any child objects in the node. Adds the
 * node as a child of the given parent node unless it is NULL.
 *
 *=========================================================================*/
int CNifImport::ParseNode (CNifNode* pNode, nifimpinfo_t& ImportInfo) {
  Matrix3	  TransformMatrix;
  TriObject*	  pTriObject;
  Mesh		  MeshObject;
  ImpNode*	  pSceneNode;
  nifimpinfo_t	  NewImpInfo;
  INode*	  pINode;
  int		  Result;

	/* Create a node in the scene */
  pSceneNode = m_pImpInt->CreateNode();
  pSceneNode->SetName(pNode->GetRecordName());
  NewImpInfo.pParent    = pSceneNode;
  NewImpInfo.ChildIndex = ImportInfo.ChildIndex;

	/* Set the transformation matrix */
  TransformMatrix = CreateTransformMatrix(pNode->GetFloatData());
  pSceneNode->SetTransform(0, TransformMatrix);

	/* Create a mesh object for the scene node */
  pTriObject = CreateNewTriObject();
  pTriObject->GetMesh() = MeshObject;
  pSceneNode->Reference(pTriObject);

	/* Set INode parameters */
  pINode = pSceneNode->GetINode();
  pINode->SetWireColor(NIFIMP_COLOR_MESH);

	/* Iterate through any children in node */
  Result = ParseNodeChildren(pNode, NewImpInfo);

	/* Parse any keyframe data if required */
  if (Result == IMPEXP_SUCCESS) Result = ParseKeyFrame(pNode, NewImpInfo);
  

	/* Attach the node to the required parent */
  AttachNode(ImportInfo.pParent, pSceneNode);

  	/* Add the root node to the scene if required */
  if (ImportInfo.pParent == NULL) m_pImpInt->AddNodeToScene(pSceneNode);
  return (Result);
 }
/*===========================================================================
 *		End of Class Method CNifImport::ParseNode()
 *=========================================================================*/


/*===========================================================================
 *
 * Class CNifImport Method - int ParseNodeChildren (pNode, ImportInfo);
 *
 * Iterates through all children in the given node, creating scene objects
 * as required.
 *
 *=========================================================================*/
int CNifImport::ParseNodeChildren (CNifNode* pNode, nifimpinfo_t& ImportInfo) {
  return ParseNodeChildren(pNode->GetChildArray(), ImportInfo);
 }


int CNifImport::ParseNodeChildren (CNifLongArray* pChildArray, nifimpinfo_t& ImportInfo) {
  CNifBaseRecord* pChildObj;
  int		  ChildIndex;
  int		  Result;
  int		  Index;

  ImportInfo.NumChildren = pChildArray->GetSize();

	/* Iterate through all child nodes and trishapes */
  for (Index = 0; Index < pChildArray->GetSize(); Index++) {
    ChildIndex = pChildArray->GetAt(Index);
    pChildObj = m_NifFile.GetRecord(ChildIndex);
    if (pChildObj == NULL) continue;
    ImportInfo.ChildIndex = Index;

		/* Check for a child node record */
    if (pChildObj->IsName(NIF_RECORD_NODE)) {
      Result = ParseNode((CNifNode *) pChildObj, ImportInfo);
     }
		/* Root collision node, much like a NiNode */
    else if (pChildObj->IsName(NIF_RECORD_ROOTCOLLISIONNODE)) {
      Result = ParseRootCollisionNode((CNifRootCollisionNode *) pChildObj, ImportInfo);
     }
		/* Check for a child TriShape record */
    else if (pChildObj->IsName(NIF_RECORD_TRISHAPE)) {
      Result = ParseTriShape((CNifTriShape *) pChildObj, ImportInfo);
     }
		/* Unknown record type */
    else {
      SystemLog.Printf(_T("Unknown child record %s!"), pChildObj->GetName());
     }
   }

  return (IMPEXP_SUCCESS);
 }
/*===========================================================================
 *		End of Class Method CNifImport::ParseNodeChildren()
 *=========================================================================*/


/*===========================================================================
 *
 * Class CNifImport Method - int ParseRootCollisionNode (pNode, ImportInfo);
 *
 * Protected class method to parse a NIF root collison node record. Basically
 * the same as the ParseNode() but changes the root node properties.
 *
 *=========================================================================*/
int CNifImport::ParseRootCollisionNode (CNifRootCollisionNode* pNode, nifimpinfo_t& ImportInfo) {
  Matrix3	  TransformMatrix;
  TriObject*	  pTriObject;
  Mesh		  MeshObject;
  ImpNode*	  pSceneNode;
  INode*	  pINode;
  nifimpinfo_t	NewImpInfo;
  int		Result;

  NewImpInfo = ImportInfo;
  NewImpInfo.IsCollision = true;
  
  /*Result = ParseNodeChildren(pNode->GetChildArray(), NewImpInfo); */
  
	/* Create a node in the scene */
  pSceneNode = m_pImpInt->CreateNode();
  pSceneNode->SetName(_T("Collision"));
  NewImpInfo.pParent    = pSceneNode;
  NewImpInfo.ChildIndex = ImportInfo.ChildIndex;

	/* Set the transformation matrix */
  TransformMatrix = CreateTransformMatrix(pNode->GetFloatData());
  pSceneNode->SetTransform(0, TransformMatrix);

	/* Create a mesh object for the scene node */
  pTriObject = CreateNewTriObject();
  pTriObject->GetMesh() = MeshObject;
  pSceneNode->Reference(pTriObject);

	/* Set INode parameters */
  pINode = pSceneNode->GetINode();
  pINode->SetWireColor(NIFIMP_COLOR_ROOTCOL);
  pINode->SetRenderable(FALSE);
  
	/* Iterate through any children in node */
  Result = ParseNodeChildren(pNode->GetChildArray(), NewImpInfo);

	/* Attach the node to the required parent */
  AttachNode(ImportInfo.pParent, pSceneNode);
  return (Result);
 }
/*===========================================================================
 *		End of Class Method CNifImport::ParseRootCollisionNode()
 *=========================================================================*/


/*===========================================================================
 *
 * Class CNifImport Method - int ParseTriShape (pTriShape, ImportInfo);
 *
 * Protected class method to parse a NIF tri-shape record to the given
 * parent node in the scene.
 *
 *=========================================================================*/
int CNifImport::ParseTriShape (CNifTriShape* pTriShape, nifimpinfo_t& ImportInfo) {
  Matrix3	    TransMatrix;
  nifimpinfo_t	    NewImpInfo;
  ImpNode*	    pSceneNode;
  INode*	    pINode = ImportInfo.pParent->GetINode();
  CNifTriShapeData* pTriShapeData;
  StdMat2*	    pMaterial = NULL;
  CString	    Buffer;
  bool		    SameName;
  int		    Result;

  	/* Get the TriShapeData record associated with the TriShape */
  pTriShapeData = (CNifTriShapeData *) m_NifFile.GetRecord(pTriShape->GetTriShapeDataIndex());

  if (pTriShapeData == NULL) {
    ErrorHandler.AddError(ERR_BADINPUT, _T("NiTriShape record found with no NiTriShapeData reference!"));
    return (IMPEXP_FAIL);
   }

	/* See if we should use the parent node or create a new node? */
  SameName = StringCompare(pINode->GetName(), pTriShape->GetRecordName()) == 0;
  
	/* Create the node for the TriShape */
  if (!SameName) {
    pSceneNode = m_pImpInt->CreateNode();
    pSceneNode->SetName(pTriShape->GetRecordName());
    NewImpInfo         = ImportInfo;
    NewImpInfo.pParent = pSceneNode;

		/* Modify the current node's transformation matrix if valid */
    TransMatrix = CreateTransformMatrix(pTriShape->GetFloatData());
    pSceneNode->SetTransform(0, TransMatrix);

		/* Attach the trishape node to the parent */
    AttachNode(ImportInfo.pParent, pSceneNode);

    		/* Set INode parameters */
    pINode = pSceneNode->GetINode();

    if (ImportInfo.IsCollision) {
      pINode->SetWireColor(NIFIMP_COLOR_ROOTCOL);
      pINode->SetRenderable(FALSE);
      Buffer.Format(_T("Collision%d"), ImportInfo.ChildIndex+1);
      pSceneNode->SetName(_T("Buffer"));
     }
    else {
      pINode->SetWireColor(NIFIMP_COLOR_MESH);
     }
   }
  else {
    pSceneNode = ImportInfo.pParent;
    NewImpInfo.pParent = pSceneNode;
   }
  
	/* Get the material information fron the trishape */
  pMaterial = CreateMaterial(pTriShape);

	/* Get and parse the model data to create the object */
  Result = ParseTriShapeData(pTriShapeData, NewImpInfo);
  AssignMaterial(pSceneNode, pMaterial);
  return (Result);
 }
/*===========================================================================
 *		End of Class Method CNifImport::ParseTriShape()
 *=========================================================================*/


/*===========================================================================
 *
 * Class CNifImport Method - int ParseTriShapeData (pTriShapeData, ImportInfo);
 *
 * Protected class method to parse a NIF tri-shape data record and attach
 * it to the given parent object.
 *
 *=========================================================================*/
int CNifImport::ParseTriShapeData (CNifTriShapeData* pTriShapeData, nifimpinfo_t& ImportInfo) {
  Mesh		MeshObject;
  TriObject*	pTriObject;
  bool		Result;

	/* Create a new tri-shape object */
  SystemLog.Printf(_T("\tCreating Tri-Mesh Object"));
  pTriObject = CreateNewTriObject();

  if (pTriObject == NULL) {
    ErrorHandler.AddError(ERR_CUSTOM, _T("Failed to create a new Tri-Mesh object!"));
    return (IMPEXP_FAIL);
   }

	/* Create the mesh object */
  SystemLog.Printf(_T("\tSetting Mesh Object Data"));
  Result  = CreateMeshPoints (&MeshObject, pTriShapeData);
  Result &= CreateMeshFaces  (&MeshObject, pTriShapeData);
  Result &= CreateMeshNormals(&MeshObject, pTriShapeData);
  if (pTriShapeData->HasVertexColors()) Result &= CreateVertexColors(&MeshObject, pTriShapeData);
  if (!Result) return (IMPEXP_FAIL);
  
	/* Update the mesh in the scene */
  SystemLog.Printf(_T("\tSaving Tri-Mesh Object"));
  pTriObject->GetMesh() = MeshObject;
  ImportInfo.pParent->Reference(pTriObject);

  return (IMPEXP_SUCCESS);
 }
/*===========================================================================
 *		End of Class Method CNifImport::ParseTriShapeData()
 *=========================================================================*/


/*===========================================================================
 *
 * Class CNifImport Method - bool ParseAlphaProperty (pMaterial, pAlphaProp);
 *
 * Parses a NiAlphaProperty record, updating the given standard material
 * object. Returns false on any error.
 *
 *=========================================================================*/
bool CNifImport::ParseAlphaProperty (StdMat2* pMaterial, CNifAlphaProperty* pAlphaProp) {
  //DEFINE_FUNCTION("CNifImport::ParseAlphaProperty()");
  Texmap* pDiffuseMap;

	/* See if the material has a diffuse map already assigned */
  if (pMaterial->MapEnabled(ID_DI)) {
    pDiffuseMap = pMaterial->GetSubTexmap(ID_DI);
    pMaterial->SetSubTexmap(ID_OP, pDiffuseMap);  
   }

  pMaterial->EnableMap(ID_OP, TRUE);
  return (true);
 }
/*===========================================================================
 *		End of Class Method CNifImport::ParseAlphaProperty()
 *=========================================================================*/


/*===========================================================================
 *
 * Class CNifImport Method - bool ParseMaterialProperty (pMaterial, pMaterialProp);
 *
 * Parses a NiMaterialProperty record, updating the given standard material
 * object. Returns false on any error.
 *
 *=========================================================================*/
bool CNifImport::ParseMaterialProperty (StdMat2* pMaterial, CNifMaterialProperty* pMaterialProp) {
  SystemLog.Printf(_T("\t\t\tMaterialProperty '%s'"), pMaterialProp->GetRecordName());

	/* Set the basic material properties */	
  pMaterial->SetName(pMaterialProp->GetRecordName());
  pMaterial->SetAmbient(Color(pMaterialProp->GetAmbientColor()), 0);
  pMaterial->SetDiffuse(Color(pMaterialProp->GetDiffuseColor()),0);
  pMaterial->SetSpecular(Color(pMaterialProp->GetSpecularColor()),0);
  pMaterial->SetShininess(pMaterialProp->GetGlossiness(), 0);
  pMaterial->SetOpacity(pMaterialProp->GetOpacity(), 0);
  pMaterial->SetSelfIllumColor(pMaterialProp->GetIllumColor(), 0);
  pMaterial->SetSelfIllumColorOn(pMaterialProp->GetIllumColor() != 0);

	/* This is set, if at all, in the ParseSpecularProperty() method */
  //pMaterial->SetShinStr(0.1f, 0);

  return (IMPEXP_SUCCESS);
 }
/*===========================================================================
 *		End of Class Method CNifImport::ParseMaterialProperty()
 *=========================================================================*/


/*===========================================================================
 *
 * Class CNifImport Method - bool ParseSpecularProperty (pMaterial, pSpecularProp);
 *
 * Parses a NiSpecularlProperty record, updating the given standard material
 * object. Returns false on any error.
 *
 *=========================================================================*/
bool CNifImport::ParseSpecularProperty (StdMat2* pMaterial, CNifSpecularProperty* pSpecularProp) {

	/* BUG: SetShinStr() doesn't appear to do anything? */
  SystemLog.Printf(_T("\t\t\tSpecularProperty, %d"), pSpecularProp->GetUnknown3());
  pMaterial->SetShinStr(0.7f, 0);

  return (IMPEXP_SUCCESS);
 }
/*===========================================================================
 *		End of Class Method CNifImport::ParseSpecularProperty()
 *=========================================================================*/


/*===========================================================================
 *
 * Class CNifImport Method - bool ParseSourceTexture (pMaterial, pSourceTexture);
 *
 * Parses a NiSourceTexture record, updating the given standard material
 * object. Returns false on any error.
 *
 *=========================================================================*/
bool CNifImport::ParseSourceTexture (StdMat2* pMaterial, CNifSourceTexture* pSourceTexture) {
  //DEFINE_FUNCTION("CNifImport::ParseSourceTexture()");
  BitmapTex* pTexMap;

  SystemLog.Printf(_T("\t\t\tSourceTexture '%s'"), pSourceTexture->GetRecordName());

	/* Create the diffuse texture map */
  pTexMap = NewDefaultBitmapTex();

	/* Set the map options */
  pTexMap->SetMapName((TCHAR *)pSourceTexture->GetRecordName());
  pTexMap->SetAlphaAsMono(TRUE);
  pTexMap->SetAlphaSource(ALPHA_NONE);

	/* Assign the map to the material channel */
  pMaterial->EnableMap(ID_DI, TRUE);
  pMaterial->SetSubTexmap(ID_DI, pTexMap);  

  	/* See if the material has a opacity map already assigned */
  if (pMaterial->MapEnabled(ID_OP)) {
    pMaterial->SetSubTexmap(ID_OP, pTexMap);  
   }
  
  return (true);
 }
/*===========================================================================
 *		End of Class Method CNifImport::ParseSourceTexture()
 *=========================================================================*/


/*===========================================================================
 *
 * Class CNifImport Method - bool ParseTexturingProperty (pMaterial, pTextureProp);
 *
 * Parses a NiTexturingProperty record, updating the given standard material
 * object. Returns false on any error.
 *
 *=========================================================================*/
bool CNifImport::ParseTexturingProperty (StdMat2* pMaterial, CNifTexturingProperty* pTextureProp) {
  CNifBaseRecord* pRecord;
  bool		  Result;

  SystemLog.Printf(_T("\t\t\tTexturingProperty, Index = %d, HasTexture = %d"), pTextureProp->GetTextureIndex(),
			pTextureProp->HasTextureIndex());

	/* See if we need to add a texture map */
  if (pTextureProp->HasTextureIndex()) {
    pRecord = m_NifFile.GetRecord(pTextureProp->GetTextureIndex());
    SystemLog.Printf(_T("\t\t\tTextureRecord = '%s'"), pRecord == NULL ? _T("NULL") : pRecord->GetName());

    if (pRecord != NULL && pRecord->IsName(NIF_RECORD_SOURCETEXTURE)) {
      Result = ParseSourceTexture(pMaterial, (CNifSourceTexture *) pRecord);
      if (!Result) return (false);
     }
    else {
      SystemLog.Printf(_T("\t\t\t\tUnknown texture type %s!"), pRecord->GetName());
     }
   }  

  return (IMPEXP_SUCCESS);
 }
/*===========================================================================
 *		End of Class Method CNifImport::ParseTexturingProperty()
 *=========================================================================*/


/*===========================================================================
 *
 * Class CNifImport Method - int TestMesh (void);
 *
 * Creates some test objects in the scene.
 *
 *=========================================================================*/
int CNifImport::TestMesh (void) {
  //DEFINE_FUNCTION("CNifImport::TestMesh()");
  ImpNode*	pNode1;
  ImpNode*	pNode2;
  INode*	pINode1;
  INode*	pINode2;
  Mesh		MeshObject1;
  Mesh		MeshObject2;
  TriObject*	pTriObject1;
  TriObject*	pTriObject2;

	/* Create a node in the scene */
  pNode1 = m_pImpInt->CreateNode();
  pNode1->SetName(_T("TestNode1"));
  pNode2 = m_pImpInt->CreateNode();
  pNode2->SetName(_T("TestNode2"));

  //CreateBox(MeshObject1, 1);
  CreateBox(MeshObject2, 2);

  pTriObject1 = CreateNewTriObject();
  pTriObject1->GetMesh() = MeshObject1;
  pTriObject2 = CreateNewTriObject();
  pTriObject2->GetMesh() = MeshObject2;

  pNode1->Reference(pTriObject1);
  pNode2->Reference(pTriObject2);

  pINode1 = pNode1->GetINode();
  pINode2 = pNode2->GetINode();

  pINode1->AttachChild(pINode2);

  m_pImpInt->AddNodeToScene(pNode1);
  m_pImpInt->AddNodeToScene(pNode2);

  return (IMPEXP_SUCCESS);
 }
/*===========================================================================
 *		End of Class Method CNifImport::TestMesh()
 *=========================================================================*/


/*===========================================================================
 *
 * Class CNifImport Method - int TestMesh1 (void);
 *
 * Creates some test objects in the scene.
 *
 *=========================================================================*/
int CNifImport::TestMesh1 (void) {
  //DEFINE_FUNCTION("CNifImport::TestMesh1()");
  ImpNode*	pNode1;
  ImpNode*	pNode2;
  INode*	pINode1;
  INode*	pINode2;
  Mesh		MeshObject1;
  Mesh		MeshObject2;
  TriObject*	pTriObject1;
  TriObject*	pTriObject2;

	/* Create a node in the scene */
  pNode1 = m_pImpInt->CreateNode();
  pNode1->SetName(_T("TestNode1"));
  pNode2 = m_pImpInt->CreateNode();
  pNode2->SetName(_T("TestNode2"));

  CreateBox(MeshObject1, 1);
  CreateBox(MeshObject2, 2);

  pTriObject1 = CreateNewTriObject();
  pTriObject1->GetMesh() = MeshObject1;
  pTriObject2 = CreateNewTriObject();
  pTriObject2->GetMesh() = MeshObject2;

  pNode1->Reference(pTriObject1);
  pNode2->Reference(pTriObject2);

  pINode1 = pNode1->GetINode();
  pINode2 = pNode2->GetINode();

  pINode1->AttachChild(pINode2);

  m_pImpInt->AddNodeToScene(pNode1);
  //m_pImpInt->AddNodeToScene(pNode2);

  return (IMPEXP_SUCCESS);
 }
/*===========================================================================
 *		End of Class Method CNifImport::TestMesh1()
 *=========================================================================*/
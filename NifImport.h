/*===========================================================================
 *
 * File:	Nifimport.H
 * Author:	Dave Humphrey (uesp@m0use.net)
 * Created On:	Tuesday, December 23, 2003
 *
 * Description
 *
 *=========================================================================*/
#ifndef __NIFIMPORT_H
#define __NIFIMPORT_H


/*===========================================================================
 *
 * Begin Required Includes
 *
 *=========================================================================*/
  #include "NifFile.h"
  #include "NifNode.h"
  #include "NifTriShape.h"
  #include "NifTriShapeData.h"
  #include "NifMaterialProperty.h"
  #include "NifSourceTexture.h"
  #include "NifTextureProperty.h"
  #include "NifAlphaProperty.h"
  #include "NifSpecularProperty.h"
  #include "NifKeyFrameController.h"
  #include "NifKeyFrameData.h"
  #include "Max.h"
  #include "stdmat.h"
/*===========================================================================
 *		End of Required Includes
 *=========================================================================*/


/*===========================================================================
 *
 * Begin Definitions
 *
 *=========================================================================*/

	/* Colors */
  #define NIFIMP_COLOR_MESH	0x800000
  #define NIFIMP_COLOR_ROOTCOL	0x000080

/*===========================================================================
 *		End of Definitions
 *=========================================================================*/


/*===========================================================================
 *
 * Begin Type Definitions
 *
 *=========================================================================*/

	/* Used during the importation process to pass information through
	 * the methods */
  class nifimpinfo_t {
    public:
	ImpNode*	pParent;
	int		ChildIndex;
	int		NumChildren;
	bool		IsCollision;

	nifimpinfo_t() { pParent = NULL; IsCollision = false; ChildIndex = 0; NumChildren = 0; }
   };

/*===========================================================================
 *		End of Type Definitions
 *=========================================================================*/


/*===========================================================================
 *
 * Begin Class CNifImport Definition
 *
 * Description
 *
 *=========================================================================*/
class CNifImport : public SceneImport {

  /*---------- Begin Private Class Members ----------------------*/
private:
  Interface*		m_pInterface;		/* Reference to the main interface object */
  static ImpInterface*  m_pImpInt;
  CNifFile		m_NifFile;		/* The nif file to import */


  /*---------- Begin Protected Class Methods --------------------*/
protected:

	/* Attempt to import the given NIF file */
  int ImportNif			(const TCHAR* pFilename);
  int LoadNif			(const TCHAR* pFilename);
  int CreateScene		(void);
  int ParseNode			(CNifNode* pNode, nifimpinfo_t& ImportInfo);
  int ParseNodeChildren		(CNifNode* pNode, nifimpinfo_t& ImportInfo);
  int ParseNodeChildren		(CNifLongArray* pChildArray, nifimpinfo_t& ImportInfo);
  int ParseTriShape		(CNifTriShape* pTriShape, nifimpinfo_t& ImportInfo);
  int ParseTriShapeData		(CNifTriShapeData* pTriShapeData, nifimpinfo_t& ImportInfo);
  int ParseRootCollisionNode	(CNifRootCollisionNode* pNode, nifimpinfo_t& ImportInfo);
  int ParseKeyFrameController	(CNifKeyFrameController* pKeyFrameCtrl, nifimpinfo_t& ImportInfo);
  int ParseKeyFrameData		(CNifKeyFrameData* pKeyFrameData, nifimpinfo_t& ImportInfo);
  int ParseKeyFrame		(CNifNode* pNode, nifimpinfo_t& ImportInfo);

	/* Helper mesh creation methods */
  bool CreateMeshFaces    (Mesh* pMesh, CNifTriShapeData* pTriShapeData);
  bool CreateMeshNormals  (Mesh* pMesh, CNifTriShapeData* pTriShapeData);
  bool CreateMeshPoints   (Mesh* pMesh, CNifTriShapeData* pTriShapeData);
  bool CreateVertexColors (Mesh* pMesh, CNifTriShapeData* pTriShapeData);

	/* Material creation helper methods */
  StdMat2* CreateMaterial	  (CNifTriShape* pTriShape);
  StdMat2* FindMaterial		  (CNifTriShape* pTriShape);
  StdMat2* FindMaterial		  (StdMat2* pMaterial);
  bool     ParseMaterialProperty  (StdMat2* pMaterial, CNifMaterialProperty*   pRecord);
  bool     ParseTexturingProperty (StdMat2* pMaterial, CNifTexturingProperty*  pRecord);
  bool     ParseAlphaProperty	  (StdMat2* pMaterial, CNifAlphaProperty*      pRecord);
  bool     ParseSourceTexture	  (StdMat2* pMaterial, CNifSourceTexture*      pRecord);
  bool     ParseSpecularProperty  (StdMat2* pMaterial, CNifSpecularProperty*   pRecord);
   
	/* Misc test/debugging methods */
  int TestMesh	(void);
  int TestMesh1	(void);


  /*---------- Begin Public Class Methods -----------------------*/
public:

	/* Class Constructors/Destructors */
  CNifImport();
  virtual ~CNifImport() { Destroy(); }
  virtual void Destroy (void);

	/* Pure virtual methods */
  int		ExtCount ();				// Number of extensions supported
  const TCHAR*	Ext (int ExtIndex);			// Extension #n (i.e. "3DS")
  const TCHAR*	LongDesc ();				// Long ASCII description (i.e. "Autodesk 3D Studio File")
  const TCHAR*	ShortDesc ();				// Short ASCII description (i.e. "3D Studio")
  const TCHAR*	AuthorName ();				// ASCII Author name
  const TCHAR*	CopyrightMessage ();			// ASCII Copyright message
  const TCHAR*	OtherMessage1 ();			// Other message #1
  const TCHAR*	OtherMessage2 ();			// Other message #2
  unsigned int	Version ();				// Version number * 100 (i.e. v3.01 = 301)
  void		ShowAbout (HWND hWnd);			// Show DLL's "About..." box
  int		DoImport (const TCHAR *name,ImpInterface *i,Interface *gi, BOOL suppressPrompts=FALSE);	// Import file

 };
/*===========================================================================
 *		End of Class CNifImport Definition
 *=========================================================================*/


/*===========================================================================
 *
 * Begin Class CNifClassDesc Definition
 *
 *=========================================================================*/
class CNifClassDesc : public ClassDesc {

public:

  int 		IsPublic()	{ return 1; }
  void*		Create (BOOL loading = FALSE) { return new CNifImport; }
  const TCHAR*	ClassName()	{ return _T("CNifClassDesc"); }
  SClass_ID	SuperClassID()	{ return SCENE_IMPORT_CLASS_ID; }
  Class_ID	ClassID()	{ return Class_ID(0x5f6c52d1, 0x3d357305); }
  const TCHAR* 	Category()	{ return _T("Scene Import");  }
 
 };
/*===========================================================================
 *		End of Class CNifClassDesc Definition
 *=========================================================================*/


#endif
/*===========================================================================
 *		End of File Nifimport.H
 *=========================================================================*/

# Microsoft Developer Studio Generated NMAKE File, Based on nifplugin1.dsp
!IF "$(CFG)" == ""
CFG=nifplugin1 - Win32 Debug
!MESSAGE No configuration specified. Defaulting to nifplugin1 - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "nifplugin1 - Win32 Release" && "$(CFG)" != "nifplugin1 - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "nifplugin1.mak" CFG="nifplugin1 - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "nifplugin1 - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "nifplugin1 - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "nifplugin1 - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

ALL : "$(OUTDIR)\nifplugin1.dll" "$(OUTDIR)\nifplugin1.bsc"


CLEAN :
	-@erase "$(INTDIR)\dl_base.obj"
	-@erase "$(INTDIR)\dl_base.sbr"
	-@erase "$(INTDIR)\dl_block.obj"
	-@erase "$(INTDIR)\dl_block.sbr"
	-@erase "$(INTDIR)\dl_chr.obj"
	-@erase "$(INTDIR)\dl_chr.sbr"
	-@erase "$(INTDIR)\dl_err.obj"
	-@erase "$(INTDIR)\dl_err.sbr"
	-@erase "$(INTDIR)\dl_file.obj"
	-@erase "$(INTDIR)\dl_file.sbr"
	-@erase "$(INTDIR)\dl_log.obj"
	-@erase "$(INTDIR)\dl_log.sbr"
	-@erase "$(INTDIR)\dl_math.obj"
	-@erase "$(INTDIR)\dl_math.sbr"
	-@erase "$(INTDIR)\dl_mem.obj"
	-@erase "$(INTDIR)\dl_mem.sbr"
	-@erase "$(INTDIR)\dl_str.obj"
	-@erase "$(INTDIR)\dl_str.sbr"
	-@erase "$(INTDIR)\dl_time.obj"
	-@erase "$(INTDIR)\dl_time.sbr"
	-@erase "$(INTDIR)\NifAlphaProperty.obj"
	-@erase "$(INTDIR)\NifAlphaProperty.sbr"
	-@erase "$(INTDIR)\NifAmbientLight.obj"
	-@erase "$(INTDIR)\NifAmbientLight.sbr"
	-@erase "$(INTDIR)\NifAutoNormalParticles.obj"
	-@erase "$(INTDIR)\NifAutoNormalParticles.sbr"
	-@erase "$(INTDIR)\NifAutoNormalParticlesData.obj"
	-@erase "$(INTDIR)\NifAutoNormalParticlesData.sbr"
	-@erase "$(INTDIR)\NifBase.obj"
	-@erase "$(INTDIR)\NifBase.sbr"
	-@erase "$(INTDIR)\NifBillboardNode.obj"
	-@erase "$(INTDIR)\NifBillboardNode.sbr"
	-@erase "$(INTDIR)\NifBsAnimationNode.obj"
	-@erase "$(INTDIR)\NifBsAnimationNode.sbr"
	-@erase "$(INTDIR)\NifBSPArrayController.obj"
	-@erase "$(INTDIR)\NifBSPArrayController.sbr"
	-@erase "$(INTDIR)\NifCamera.obj"
	-@erase "$(INTDIR)\NifCamera.sbr"
	-@erase "$(INTDIR)\NifColorData.obj"
	-@erase "$(INTDIR)\NifColorData.sbr"
	-@erase "$(INTDIR)\NifDirectionalLight.obj"
	-@erase "$(INTDIR)\NifDirectionalLight.sbr"
	-@erase "$(INTDIR)\NifEndFile.obj"
	-@erase "$(INTDIR)\NifEndFile.sbr"
	-@erase "$(INTDIR)\NifEOF.obj"
	-@erase "$(INTDIR)\NifEOF.sbr"
	-@erase "$(INTDIR)\NifFile.obj"
	-@erase "$(INTDIR)\NifFile.sbr"
	-@erase "$(INTDIR)\NifFloatArray.obj"
	-@erase "$(INTDIR)\NifFloatArray.sbr"
	-@erase "$(INTDIR)\NifFloatData.obj"
	-@erase "$(INTDIR)\NifFloatData.sbr"
	-@erase "$(INTDIR)\NifGeomMorpherController.obj"
	-@erase "$(INTDIR)\NifGeomMorpherController.sbr"
	-@erase "$(INTDIR)\NifGravity.obj"
	-@erase "$(INTDIR)\NifGravity.sbr"
	-@erase "$(INTDIR)\NifImport.obj"
	-@erase "$(INTDIR)\NifImport.sbr"
	-@erase "$(INTDIR)\NifKeyFrameController.obj"
	-@erase "$(INTDIR)\NifKeyFrameController.sbr"
	-@erase "$(INTDIR)\NifKeyFrameData.obj"
	-@erase "$(INTDIR)\NifKeyFrameData.sbr"
	-@erase "$(INTDIR)\NifLongArray.obj"
	-@erase "$(INTDIR)\NifLongArray.sbr"
	-@erase "$(INTDIR)\NifMaterialProperty.obj"
	-@erase "$(INTDIR)\NifMaterialProperty.sbr"
	-@erase "$(INTDIR)\NifMorphData.obj"
	-@erase "$(INTDIR)\NifMorphData.sbr"
	-@erase "$(INTDIR)\NifNode.obj"
	-@erase "$(INTDIR)\NifNode.sbr"
	-@erase "$(INTDIR)\NifParticleColorModifier.obj"
	-@erase "$(INTDIR)\NifParticleColorModifier.sbr"
	-@erase "$(INTDIR)\NifParticleGrowFade.obj"
	-@erase "$(INTDIR)\NifParticleGrowFade.sbr"
	-@erase "$(INTDIR)\NifParticleNode.obj"
	-@erase "$(INTDIR)\NifParticleNode.sbr"
	-@erase "$(INTDIR)\NifParticleRotation.obj"
	-@erase "$(INTDIR)\NifParticleRotation.sbr"
	-@erase "$(INTDIR)\NifParticleSysController.obj"
	-@erase "$(INTDIR)\NifParticleSysController.sbr"
	-@erase "$(INTDIR)\NifPathController.obj"
	-@erase "$(INTDIR)\NifPathController.sbr"
	-@erase "$(INTDIR)\NifPixelData.obj"
	-@erase "$(INTDIR)\NifPixelData.sbr"
	-@erase "$(INTDIR)\nifplugin1.obj"
	-@erase "$(INTDIR)\nifplugin1.pch"
	-@erase "$(INTDIR)\nifplugin1.res"
	-@erase "$(INTDIR)\nifplugin1.sbr"
	-@erase "$(INTDIR)\NifPosData.obj"
	-@erase "$(INTDIR)\NifPosData.sbr"
	-@erase "$(INTDIR)\NifRootCollisionNode.obj"
	-@erase "$(INTDIR)\NifRootCollisionNode.sbr"
	-@erase "$(INTDIR)\NifRotatingParticles.obj"
	-@erase "$(INTDIR)\NifRotatingParticles.sbr"
	-@erase "$(INTDIR)\NifRotatingParticlesData.obj"
	-@erase "$(INTDIR)\NifRotatingParticlesData.sbr"
	-@erase "$(INTDIR)\NifShadeProperty.obj"
	-@erase "$(INTDIR)\NifShadeProperty.sbr"
	-@erase "$(INTDIR)\NifShortArray.obj"
	-@erase "$(INTDIR)\NifShortArray.sbr"
	-@erase "$(INTDIR)\NifSkinData.obj"
	-@erase "$(INTDIR)\NifSkinData.sbr"
	-@erase "$(INTDIR)\NifSkinInstance.obj"
	-@erase "$(INTDIR)\NifSkinInstance.sbr"
	-@erase "$(INTDIR)\NifSourceTexture.obj"
	-@erase "$(INTDIR)\NifSourceTexture.sbr"
	-@erase "$(INTDIR)\NifStringData.obj"
	-@erase "$(INTDIR)\NifStringData.sbr"
	-@erase "$(INTDIR)\NifTextKeyExtraData.obj"
	-@erase "$(INTDIR)\NifTextKeyExtraData.sbr"
	-@erase "$(INTDIR)\NifTextureEffect.obj"
	-@erase "$(INTDIR)\NifTextureEffect.sbr"
	-@erase "$(INTDIR)\NifTextureProperty.obj"
	-@erase "$(INTDIR)\NifTextureProperty.sbr"
	-@erase "$(INTDIR)\NifTriShape.obj"
	-@erase "$(INTDIR)\NifTriShape.sbr"
	-@erase "$(INTDIR)\NifTriShapeData.obj"
	-@erase "$(INTDIR)\NifTriShapeData.sbr"
	-@erase "$(INTDIR)\NifUVController.obj"
	-@erase "$(INTDIR)\NifUVController.sbr"
	-@erase "$(INTDIR)\NifUVData.obj"
	-@erase "$(INTDIR)\NifUVData.sbr"
	-@erase "$(INTDIR)\NifVertexColorProperty.obj"
	-@erase "$(INTDIR)\NifVertexColorProperty.sbr"
	-@erase "$(INTDIR)\NifVertWeightsExtraData.obj"
	-@erase "$(INTDIR)\NifVertWeightsExtraData.sbr"
	-@erase "$(INTDIR)\NifVisController.obj"
	-@erase "$(INTDIR)\NifVisController.sbr"
	-@erase "$(INTDIR)\NifVisData.obj"
	-@erase "$(INTDIR)\NifVisData.sbr"
	-@erase "$(INTDIR)\NifWireframeProperty.obj"
	-@erase "$(INTDIR)\NifWireframeProperty.sbr"
	-@erase "$(INTDIR)\NifZBufferProperty.obj"
	-@erase "$(INTDIR)\NifZBufferProperty.sbr"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\StdAfx.sbr"
	-@erase "$(INTDIR)\tstfile.obj"
	-@erase "$(INTDIR)\tstfile.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\nifplugin1.bsc"
	-@erase "$(OUTDIR)\nifplugin1.dll"
	-@erase "$(OUTDIR)\nifplugin1.exp"
	-@erase "$(OUTDIR)\nifplugin1.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /D "_USRDLL" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\nifplugin1.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\nifplugin1.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\nifplugin1.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\dl_base.sbr" \
	"$(INTDIR)\dl_block.sbr" \
	"$(INTDIR)\dl_chr.sbr" \
	"$(INTDIR)\dl_err.sbr" \
	"$(INTDIR)\dl_file.sbr" \
	"$(INTDIR)\dl_log.sbr" \
	"$(INTDIR)\dl_math.sbr" \
	"$(INTDIR)\dl_mem.sbr" \
	"$(INTDIR)\dl_str.sbr" \
	"$(INTDIR)\dl_time.sbr" \
	"$(INTDIR)\tstfile.sbr" \
	"$(INTDIR)\NifAlphaProperty.sbr" \
	"$(INTDIR)\NifAmbientLight.sbr" \
	"$(INTDIR)\NifAutoNormalParticles.sbr" \
	"$(INTDIR)\NifAutoNormalParticlesData.sbr" \
	"$(INTDIR)\NifBase.sbr" \
	"$(INTDIR)\NifBillboardNode.sbr" \
	"$(INTDIR)\NifBsAnimationNode.sbr" \
	"$(INTDIR)\NifBSPArrayController.sbr" \
	"$(INTDIR)\NifCamera.sbr" \
	"$(INTDIR)\NifColorData.sbr" \
	"$(INTDIR)\NifDirectionalLight.sbr" \
	"$(INTDIR)\NifEndFile.sbr" \
	"$(INTDIR)\NifEOF.sbr" \
	"$(INTDIR)\NifFile.sbr" \
	"$(INTDIR)\NifFloatArray.sbr" \
	"$(INTDIR)\NifFloatData.sbr" \
	"$(INTDIR)\NifGeomMorpherController.sbr" \
	"$(INTDIR)\NifGravity.sbr" \
	"$(INTDIR)\NifKeyFrameController.sbr" \
	"$(INTDIR)\NifKeyFrameData.sbr" \
	"$(INTDIR)\NifLongArray.sbr" \
	"$(INTDIR)\NifMaterialProperty.sbr" \
	"$(INTDIR)\NifMorphData.sbr" \
	"$(INTDIR)\NifNode.sbr" \
	"$(INTDIR)\NifParticleColorModifier.sbr" \
	"$(INTDIR)\NifParticleGrowFade.sbr" \
	"$(INTDIR)\NifParticleNode.sbr" \
	"$(INTDIR)\NifParticleRotation.sbr" \
	"$(INTDIR)\NifParticleSysController.sbr" \
	"$(INTDIR)\NifPathController.sbr" \
	"$(INTDIR)\NifPixelData.sbr" \
	"$(INTDIR)\NifPosData.sbr" \
	"$(INTDIR)\NifRootCollisionNode.sbr" \
	"$(INTDIR)\NifRotatingParticles.sbr" \
	"$(INTDIR)\NifRotatingParticlesData.sbr" \
	"$(INTDIR)\NifShadeProperty.sbr" \
	"$(INTDIR)\NifShortArray.sbr" \
	"$(INTDIR)\NifSkinData.sbr" \
	"$(INTDIR)\NifSkinInstance.sbr" \
	"$(INTDIR)\NifSourceTexture.sbr" \
	"$(INTDIR)\NifStringData.sbr" \
	"$(INTDIR)\NifTextKeyExtraData.sbr" \
	"$(INTDIR)\NifTextureEffect.sbr" \
	"$(INTDIR)\NifTextureProperty.sbr" \
	"$(INTDIR)\NifTriShape.sbr" \
	"$(INTDIR)\NifTriShapeData.sbr" \
	"$(INTDIR)\NifUVController.sbr" \
	"$(INTDIR)\NifUVData.sbr" \
	"$(INTDIR)\NifVertexColorProperty.sbr" \
	"$(INTDIR)\NifVertWeightsExtraData.sbr" \
	"$(INTDIR)\NifVisController.sbr" \
	"$(INTDIR)\NifVisData.sbr" \
	"$(INTDIR)\NifWireframeProperty.sbr" \
	"$(INTDIR)\NifZBufferProperty.sbr" \
	"$(INTDIR)\StdAfx.sbr" \
	"$(INTDIR)\NifImport.sbr" \
	"$(INTDIR)\nifplugin1.sbr"

"$(OUTDIR)\nifplugin1.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=mfc42.lib mfcs42.lib MSVCRT.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\nifplugin1.pdb" /machine:I386 /nodefaultlib:"mfc42.lib mfcs42.lib MSVCRT.lib" /def:".\nifplugin1.def" /out:"$(OUTDIR)\nifplugin1.dll" /implib:"$(OUTDIR)\nifplugin1.lib" /verbose:lib 
DEF_FILE= \
	".\nifplugin1.def"
LINK32_OBJS= \
	"$(INTDIR)\dl_base.obj" \
	"$(INTDIR)\dl_block.obj" \
	"$(INTDIR)\dl_chr.obj" \
	"$(INTDIR)\dl_err.obj" \
	"$(INTDIR)\dl_file.obj" \
	"$(INTDIR)\dl_log.obj" \
	"$(INTDIR)\dl_math.obj" \
	"$(INTDIR)\dl_mem.obj" \
	"$(INTDIR)\dl_str.obj" \
	"$(INTDIR)\dl_time.obj" \
	"$(INTDIR)\tstfile.obj" \
	"$(INTDIR)\NifAlphaProperty.obj" \
	"$(INTDIR)\NifAmbientLight.obj" \
	"$(INTDIR)\NifAutoNormalParticles.obj" \
	"$(INTDIR)\NifAutoNormalParticlesData.obj" \
	"$(INTDIR)\NifBase.obj" \
	"$(INTDIR)\NifBillboardNode.obj" \
	"$(INTDIR)\NifBsAnimationNode.obj" \
	"$(INTDIR)\NifBSPArrayController.obj" \
	"$(INTDIR)\NifCamera.obj" \
	"$(INTDIR)\NifColorData.obj" \
	"$(INTDIR)\NifDirectionalLight.obj" \
	"$(INTDIR)\NifEndFile.obj" \
	"$(INTDIR)\NifEOF.obj" \
	"$(INTDIR)\NifFile.obj" \
	"$(INTDIR)\NifFloatArray.obj" \
	"$(INTDIR)\NifFloatData.obj" \
	"$(INTDIR)\NifGeomMorpherController.obj" \
	"$(INTDIR)\NifGravity.obj" \
	"$(INTDIR)\NifKeyFrameController.obj" \
	"$(INTDIR)\NifKeyFrameData.obj" \
	"$(INTDIR)\NifLongArray.obj" \
	"$(INTDIR)\NifMaterialProperty.obj" \
	"$(INTDIR)\NifMorphData.obj" \
	"$(INTDIR)\NifNode.obj" \
	"$(INTDIR)\NifParticleColorModifier.obj" \
	"$(INTDIR)\NifParticleGrowFade.obj" \
	"$(INTDIR)\NifParticleNode.obj" \
	"$(INTDIR)\NifParticleRotation.obj" \
	"$(INTDIR)\NifParticleSysController.obj" \
	"$(INTDIR)\NifPathController.obj" \
	"$(INTDIR)\NifPixelData.obj" \
	"$(INTDIR)\NifPosData.obj" \
	"$(INTDIR)\NifRootCollisionNode.obj" \
	"$(INTDIR)\NifRotatingParticles.obj" \
	"$(INTDIR)\NifRotatingParticlesData.obj" \
	"$(INTDIR)\NifShadeProperty.obj" \
	"$(INTDIR)\NifShortArray.obj" \
	"$(INTDIR)\NifSkinData.obj" \
	"$(INTDIR)\NifSkinInstance.obj" \
	"$(INTDIR)\NifSourceTexture.obj" \
	"$(INTDIR)\NifStringData.obj" \
	"$(INTDIR)\NifTextKeyExtraData.obj" \
	"$(INTDIR)\NifTextureEffect.obj" \
	"$(INTDIR)\NifTextureProperty.obj" \
	"$(INTDIR)\NifTriShape.obj" \
	"$(INTDIR)\NifTriShapeData.obj" \
	"$(INTDIR)\NifUVController.obj" \
	"$(INTDIR)\NifUVData.obj" \
	"$(INTDIR)\NifVertexColorProperty.obj" \
	"$(INTDIR)\NifVertWeightsExtraData.obj" \
	"$(INTDIR)\NifVisController.obj" \
	"$(INTDIR)\NifVisData.obj" \
	"$(INTDIR)\NifWireframeProperty.obj" \
	"$(INTDIR)\NifZBufferProperty.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\NifImport.obj" \
	"$(INTDIR)\nifplugin1.obj" \
	"$(INTDIR)\nifplugin1.res" \
	"c:\3dsmax4\maxsdk\lib\core.lib" \
	"c:\3dsmax4\maxsdk\lib\geom.lib" \
	"c:\3dsmax4\maxsdk\lib\gfx.lib" \
	"c:\3dsmax4\maxsdk\lib\maxutil.lib" \
	"c:\3dsmax4\maxsdk\lib\mesh.lib"

"$(OUTDIR)\nifplugin1.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

SOURCE="$(InputPath)"
DS_POSTBUILD_DEP=$(INTDIR)\postbld.dep

ALL : $(DS_POSTBUILD_DEP)

# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

$(DS_POSTBUILD_DEP) : "$(OUTDIR)\nifplugin1.dll" "$(OUTDIR)\nifplugin1.bsc"
   copy release\nifplugin1.dll c:\3dsmax4\plugins\nifplugin1.dli
	echo Helper for Post-build step > "$(DS_POSTBUILD_DEP)"

!ELSEIF  "$(CFG)" == "nifplugin1 - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

ALL : "$(OUTDIR)\nifplugin1.dll" "$(OUTDIR)\nifplugin1.bsc"


CLEAN :
	-@erase "$(INTDIR)\dl_base.obj"
	-@erase "$(INTDIR)\dl_base.sbr"
	-@erase "$(INTDIR)\dl_block.obj"
	-@erase "$(INTDIR)\dl_block.sbr"
	-@erase "$(INTDIR)\dl_chr.obj"
	-@erase "$(INTDIR)\dl_chr.sbr"
	-@erase "$(INTDIR)\dl_err.obj"
	-@erase "$(INTDIR)\dl_err.sbr"
	-@erase "$(INTDIR)\dl_file.obj"
	-@erase "$(INTDIR)\dl_file.sbr"
	-@erase "$(INTDIR)\dl_log.obj"
	-@erase "$(INTDIR)\dl_log.sbr"
	-@erase "$(INTDIR)\dl_math.obj"
	-@erase "$(INTDIR)\dl_math.sbr"
	-@erase "$(INTDIR)\dl_mem.obj"
	-@erase "$(INTDIR)\dl_mem.sbr"
	-@erase "$(INTDIR)\dl_str.obj"
	-@erase "$(INTDIR)\dl_str.sbr"
	-@erase "$(INTDIR)\dl_time.obj"
	-@erase "$(INTDIR)\dl_time.sbr"
	-@erase "$(INTDIR)\NifAlphaProperty.obj"
	-@erase "$(INTDIR)\NifAlphaProperty.sbr"
	-@erase "$(INTDIR)\NifAmbientLight.obj"
	-@erase "$(INTDIR)\NifAmbientLight.sbr"
	-@erase "$(INTDIR)\NifAutoNormalParticles.obj"
	-@erase "$(INTDIR)\NifAutoNormalParticles.sbr"
	-@erase "$(INTDIR)\NifAutoNormalParticlesData.obj"
	-@erase "$(INTDIR)\NifAutoNormalParticlesData.sbr"
	-@erase "$(INTDIR)\NifBase.obj"
	-@erase "$(INTDIR)\NifBase.sbr"
	-@erase "$(INTDIR)\NifBillboardNode.obj"
	-@erase "$(INTDIR)\NifBillboardNode.sbr"
	-@erase "$(INTDIR)\NifBsAnimationNode.obj"
	-@erase "$(INTDIR)\NifBsAnimationNode.sbr"
	-@erase "$(INTDIR)\NifBSPArrayController.obj"
	-@erase "$(INTDIR)\NifBSPArrayController.sbr"
	-@erase "$(INTDIR)\NifCamera.obj"
	-@erase "$(INTDIR)\NifCamera.sbr"
	-@erase "$(INTDIR)\NifColorData.obj"
	-@erase "$(INTDIR)\NifColorData.sbr"
	-@erase "$(INTDIR)\NifDirectionalLight.obj"
	-@erase "$(INTDIR)\NifDirectionalLight.sbr"
	-@erase "$(INTDIR)\NifEndFile.obj"
	-@erase "$(INTDIR)\NifEndFile.sbr"
	-@erase "$(INTDIR)\NifEOF.obj"
	-@erase "$(INTDIR)\NifEOF.sbr"
	-@erase "$(INTDIR)\NifFile.obj"
	-@erase "$(INTDIR)\NifFile.sbr"
	-@erase "$(INTDIR)\NifFloatArray.obj"
	-@erase "$(INTDIR)\NifFloatArray.sbr"
	-@erase "$(INTDIR)\NifFloatData.obj"
	-@erase "$(INTDIR)\NifFloatData.sbr"
	-@erase "$(INTDIR)\NifGeomMorpherController.obj"
	-@erase "$(INTDIR)\NifGeomMorpherController.sbr"
	-@erase "$(INTDIR)\NifGravity.obj"
	-@erase "$(INTDIR)\NifGravity.sbr"
	-@erase "$(INTDIR)\NifImport.obj"
	-@erase "$(INTDIR)\NifImport.sbr"
	-@erase "$(INTDIR)\NifKeyFrameController.obj"
	-@erase "$(INTDIR)\NifKeyFrameController.sbr"
	-@erase "$(INTDIR)\NifKeyFrameData.obj"
	-@erase "$(INTDIR)\NifKeyFrameData.sbr"
	-@erase "$(INTDIR)\NifLongArray.obj"
	-@erase "$(INTDIR)\NifLongArray.sbr"
	-@erase "$(INTDIR)\NifMaterialProperty.obj"
	-@erase "$(INTDIR)\NifMaterialProperty.sbr"
	-@erase "$(INTDIR)\NifMorphData.obj"
	-@erase "$(INTDIR)\NifMorphData.sbr"
	-@erase "$(INTDIR)\NifNode.obj"
	-@erase "$(INTDIR)\NifNode.sbr"
	-@erase "$(INTDIR)\NifParticleColorModifier.obj"
	-@erase "$(INTDIR)\NifParticleColorModifier.sbr"
	-@erase "$(INTDIR)\NifParticleGrowFade.obj"
	-@erase "$(INTDIR)\NifParticleGrowFade.sbr"
	-@erase "$(INTDIR)\NifParticleNode.obj"
	-@erase "$(INTDIR)\NifParticleNode.sbr"
	-@erase "$(INTDIR)\NifParticleRotation.obj"
	-@erase "$(INTDIR)\NifParticleRotation.sbr"
	-@erase "$(INTDIR)\NifParticleSysController.obj"
	-@erase "$(INTDIR)\NifParticleSysController.sbr"
	-@erase "$(INTDIR)\NifPathController.obj"
	-@erase "$(INTDIR)\NifPathController.sbr"
	-@erase "$(INTDIR)\NifPixelData.obj"
	-@erase "$(INTDIR)\NifPixelData.sbr"
	-@erase "$(INTDIR)\nifplugin1.obj"
	-@erase "$(INTDIR)\nifplugin1.pch"
	-@erase "$(INTDIR)\nifplugin1.res"
	-@erase "$(INTDIR)\nifplugin1.sbr"
	-@erase "$(INTDIR)\NifPosData.obj"
	-@erase "$(INTDIR)\NifPosData.sbr"
	-@erase "$(INTDIR)\NifRootCollisionNode.obj"
	-@erase "$(INTDIR)\NifRootCollisionNode.sbr"
	-@erase "$(INTDIR)\NifRotatingParticles.obj"
	-@erase "$(INTDIR)\NifRotatingParticles.sbr"
	-@erase "$(INTDIR)\NifRotatingParticlesData.obj"
	-@erase "$(INTDIR)\NifRotatingParticlesData.sbr"
	-@erase "$(INTDIR)\NifShadeProperty.obj"
	-@erase "$(INTDIR)\NifShadeProperty.sbr"
	-@erase "$(INTDIR)\NifShortArray.obj"
	-@erase "$(INTDIR)\NifShortArray.sbr"
	-@erase "$(INTDIR)\NifSkinData.obj"
	-@erase "$(INTDIR)\NifSkinData.sbr"
	-@erase "$(INTDIR)\NifSkinInstance.obj"
	-@erase "$(INTDIR)\NifSkinInstance.sbr"
	-@erase "$(INTDIR)\NifSourceTexture.obj"
	-@erase "$(INTDIR)\NifSourceTexture.sbr"
	-@erase "$(INTDIR)\NifStringData.obj"
	-@erase "$(INTDIR)\NifStringData.sbr"
	-@erase "$(INTDIR)\NifTextKeyExtraData.obj"
	-@erase "$(INTDIR)\NifTextKeyExtraData.sbr"
	-@erase "$(INTDIR)\NifTextureEffect.obj"
	-@erase "$(INTDIR)\NifTextureEffect.sbr"
	-@erase "$(INTDIR)\NifTextureProperty.obj"
	-@erase "$(INTDIR)\NifTextureProperty.sbr"
	-@erase "$(INTDIR)\NifTriShape.obj"
	-@erase "$(INTDIR)\NifTriShape.sbr"
	-@erase "$(INTDIR)\NifTriShapeData.obj"
	-@erase "$(INTDIR)\NifTriShapeData.sbr"
	-@erase "$(INTDIR)\NifUVController.obj"
	-@erase "$(INTDIR)\NifUVController.sbr"
	-@erase "$(INTDIR)\NifUVData.obj"
	-@erase "$(INTDIR)\NifUVData.sbr"
	-@erase "$(INTDIR)\NifVertexColorProperty.obj"
	-@erase "$(INTDIR)\NifVertexColorProperty.sbr"
	-@erase "$(INTDIR)\NifVertWeightsExtraData.obj"
	-@erase "$(INTDIR)\NifVertWeightsExtraData.sbr"
	-@erase "$(INTDIR)\NifVisController.obj"
	-@erase "$(INTDIR)\NifVisController.sbr"
	-@erase "$(INTDIR)\NifVisData.obj"
	-@erase "$(INTDIR)\NifVisData.sbr"
	-@erase "$(INTDIR)\NifWireframeProperty.obj"
	-@erase "$(INTDIR)\NifWireframeProperty.sbr"
	-@erase "$(INTDIR)\NifZBufferProperty.obj"
	-@erase "$(INTDIR)\NifZBufferProperty.sbr"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\StdAfx.sbr"
	-@erase "$(INTDIR)\tstfile.obj"
	-@erase "$(INTDIR)\tstfile.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\nifplugin1.bsc"
	-@erase "$(OUTDIR)\nifplugin1.dll"
	-@erase "$(OUTDIR)\nifplugin1.exp"
	-@erase "$(OUTDIR)\nifplugin1.ilk"
	-@erase "$(OUTDIR)\nifplugin1.lib"
	-@erase "$(OUTDIR)\nifplugin1.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /D "_USRDLL" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\nifplugin1.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\nifplugin1.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\nifplugin1.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\dl_base.sbr" \
	"$(INTDIR)\dl_block.sbr" \
	"$(INTDIR)\dl_chr.sbr" \
	"$(INTDIR)\dl_err.sbr" \
	"$(INTDIR)\dl_file.sbr" \
	"$(INTDIR)\dl_log.sbr" \
	"$(INTDIR)\dl_math.sbr" \
	"$(INTDIR)\dl_mem.sbr" \
	"$(INTDIR)\dl_str.sbr" \
	"$(INTDIR)\dl_time.sbr" \
	"$(INTDIR)\tstfile.sbr" \
	"$(INTDIR)\NifAlphaProperty.sbr" \
	"$(INTDIR)\NifAmbientLight.sbr" \
	"$(INTDIR)\NifAutoNormalParticles.sbr" \
	"$(INTDIR)\NifAutoNormalParticlesData.sbr" \
	"$(INTDIR)\NifBase.sbr" \
	"$(INTDIR)\NifBillboardNode.sbr" \
	"$(INTDIR)\NifBsAnimationNode.sbr" \
	"$(INTDIR)\NifBSPArrayController.sbr" \
	"$(INTDIR)\NifCamera.sbr" \
	"$(INTDIR)\NifColorData.sbr" \
	"$(INTDIR)\NifDirectionalLight.sbr" \
	"$(INTDIR)\NifEndFile.sbr" \
	"$(INTDIR)\NifEOF.sbr" \
	"$(INTDIR)\NifFile.sbr" \
	"$(INTDIR)\NifFloatArray.sbr" \
	"$(INTDIR)\NifFloatData.sbr" \
	"$(INTDIR)\NifGeomMorpherController.sbr" \
	"$(INTDIR)\NifGravity.sbr" \
	"$(INTDIR)\NifKeyFrameController.sbr" \
	"$(INTDIR)\NifKeyFrameData.sbr" \
	"$(INTDIR)\NifLongArray.sbr" \
	"$(INTDIR)\NifMaterialProperty.sbr" \
	"$(INTDIR)\NifMorphData.sbr" \
	"$(INTDIR)\NifNode.sbr" \
	"$(INTDIR)\NifParticleColorModifier.sbr" \
	"$(INTDIR)\NifParticleGrowFade.sbr" \
	"$(INTDIR)\NifParticleNode.sbr" \
	"$(INTDIR)\NifParticleRotation.sbr" \
	"$(INTDIR)\NifParticleSysController.sbr" \
	"$(INTDIR)\NifPathController.sbr" \
	"$(INTDIR)\NifPixelData.sbr" \
	"$(INTDIR)\NifPosData.sbr" \
	"$(INTDIR)\NifRootCollisionNode.sbr" \
	"$(INTDIR)\NifRotatingParticles.sbr" \
	"$(INTDIR)\NifRotatingParticlesData.sbr" \
	"$(INTDIR)\NifShadeProperty.sbr" \
	"$(INTDIR)\NifShortArray.sbr" \
	"$(INTDIR)\NifSkinData.sbr" \
	"$(INTDIR)\NifSkinInstance.sbr" \
	"$(INTDIR)\NifSourceTexture.sbr" \
	"$(INTDIR)\NifStringData.sbr" \
	"$(INTDIR)\NifTextKeyExtraData.sbr" \
	"$(INTDIR)\NifTextureEffect.sbr" \
	"$(INTDIR)\NifTextureProperty.sbr" \
	"$(INTDIR)\NifTriShape.sbr" \
	"$(INTDIR)\NifTriShapeData.sbr" \
	"$(INTDIR)\NifUVController.sbr" \
	"$(INTDIR)\NifUVData.sbr" \
	"$(INTDIR)\NifVertexColorProperty.sbr" \
	"$(INTDIR)\NifVertWeightsExtraData.sbr" \
	"$(INTDIR)\NifVisController.sbr" \
	"$(INTDIR)\NifVisData.sbr" \
	"$(INTDIR)\NifWireframeProperty.sbr" \
	"$(INTDIR)\NifZBufferProperty.sbr" \
	"$(INTDIR)\StdAfx.sbr" \
	"$(INTDIR)\NifImport.sbr" \
	"$(INTDIR)\nifplugin1.sbr"

"$(OUTDIR)\nifplugin1.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=mfc42.lib mfcs42.lib MSVCRT.lib /nologo /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\nifplugin1.pdb" /debug /machine:I386 /nodefaultlib:"mfc42.lib mfcs42.lib MSVCRT.lib" /def:".\nifplugin1.def" /out:"$(OUTDIR)\nifplugin1.dll" /implib:"$(OUTDIR)\nifplugin1.lib" /pdbtype:sept 
DEF_FILE= \
	".\nifplugin1.def"
LINK32_OBJS= \
	"$(INTDIR)\dl_base.obj" \
	"$(INTDIR)\dl_block.obj" \
	"$(INTDIR)\dl_chr.obj" \
	"$(INTDIR)\dl_err.obj" \
	"$(INTDIR)\dl_file.obj" \
	"$(INTDIR)\dl_log.obj" \
	"$(INTDIR)\dl_math.obj" \
	"$(INTDIR)\dl_mem.obj" \
	"$(INTDIR)\dl_str.obj" \
	"$(INTDIR)\dl_time.obj" \
	"$(INTDIR)\tstfile.obj" \
	"$(INTDIR)\NifAlphaProperty.obj" \
	"$(INTDIR)\NifAmbientLight.obj" \
	"$(INTDIR)\NifAutoNormalParticles.obj" \
	"$(INTDIR)\NifAutoNormalParticlesData.obj" \
	"$(INTDIR)\NifBase.obj" \
	"$(INTDIR)\NifBillboardNode.obj" \
	"$(INTDIR)\NifBsAnimationNode.obj" \
	"$(INTDIR)\NifBSPArrayController.obj" \
	"$(INTDIR)\NifCamera.obj" \
	"$(INTDIR)\NifColorData.obj" \
	"$(INTDIR)\NifDirectionalLight.obj" \
	"$(INTDIR)\NifEndFile.obj" \
	"$(INTDIR)\NifEOF.obj" \
	"$(INTDIR)\NifFile.obj" \
	"$(INTDIR)\NifFloatArray.obj" \
	"$(INTDIR)\NifFloatData.obj" \
	"$(INTDIR)\NifGeomMorpherController.obj" \
	"$(INTDIR)\NifGravity.obj" \
	"$(INTDIR)\NifKeyFrameController.obj" \
	"$(INTDIR)\NifKeyFrameData.obj" \
	"$(INTDIR)\NifLongArray.obj" \
	"$(INTDIR)\NifMaterialProperty.obj" \
	"$(INTDIR)\NifMorphData.obj" \
	"$(INTDIR)\NifNode.obj" \
	"$(INTDIR)\NifParticleColorModifier.obj" \
	"$(INTDIR)\NifParticleGrowFade.obj" \
	"$(INTDIR)\NifParticleNode.obj" \
	"$(INTDIR)\NifParticleRotation.obj" \
	"$(INTDIR)\NifParticleSysController.obj" \
	"$(INTDIR)\NifPathController.obj" \
	"$(INTDIR)\NifPixelData.obj" \
	"$(INTDIR)\NifPosData.obj" \
	"$(INTDIR)\NifRootCollisionNode.obj" \
	"$(INTDIR)\NifRotatingParticles.obj" \
	"$(INTDIR)\NifRotatingParticlesData.obj" \
	"$(INTDIR)\NifShadeProperty.obj" \
	"$(INTDIR)\NifShortArray.obj" \
	"$(INTDIR)\NifSkinData.obj" \
	"$(INTDIR)\NifSkinInstance.obj" \
	"$(INTDIR)\NifSourceTexture.obj" \
	"$(INTDIR)\NifStringData.obj" \
	"$(INTDIR)\NifTextKeyExtraData.obj" \
	"$(INTDIR)\NifTextureEffect.obj" \
	"$(INTDIR)\NifTextureProperty.obj" \
	"$(INTDIR)\NifTriShape.obj" \
	"$(INTDIR)\NifTriShapeData.obj" \
	"$(INTDIR)\NifUVController.obj" \
	"$(INTDIR)\NifUVData.obj" \
	"$(INTDIR)\NifVertexColorProperty.obj" \
	"$(INTDIR)\NifVertWeightsExtraData.obj" \
	"$(INTDIR)\NifVisController.obj" \
	"$(INTDIR)\NifVisData.obj" \
	"$(INTDIR)\NifWireframeProperty.obj" \
	"$(INTDIR)\NifZBufferProperty.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\NifImport.obj" \
	"$(INTDIR)\nifplugin1.obj" \
	"$(INTDIR)\nifplugin1.res" \
	"c:\3dsmax4\maxsdk\lib\core.lib" \
	"c:\3dsmax4\maxsdk\lib\geom.lib" \
	"c:\3dsmax4\maxsdk\lib\gfx.lib" \
	"c:\3dsmax4\maxsdk\lib\maxutil.lib" \
	"c:\3dsmax4\maxsdk\lib\mesh.lib"

"$(OUTDIR)\nifplugin1.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("nifplugin1.dep")
!INCLUDE "nifplugin1.dep"
!ELSE 
!MESSAGE Warning: cannot find "nifplugin1.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "nifplugin1 - Win32 Release" || "$(CFG)" == "nifplugin1 - Win32 Debug"
SOURCE=..\..\..\..\Source\common\dl_base.cpp

!IF  "$(CFG)" == "nifplugin1 - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /D "_USRDLL" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\dl_base.obj"	"$(INTDIR)\dl_base.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "nifplugin1 - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /D "_USRDLL" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

"$(INTDIR)\dl_base.obj"	"$(INTDIR)\dl_base.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=..\..\..\..\Source\common\dl_block.cpp

!IF  "$(CFG)" == "nifplugin1 - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /D "_USRDLL" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\dl_block.obj"	"$(INTDIR)\dl_block.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "nifplugin1 - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /D "_USRDLL" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

"$(INTDIR)\dl_block.obj"	"$(INTDIR)\dl_block.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=..\..\..\..\Source\common\dl_chr.cpp

!IF  "$(CFG)" == "nifplugin1 - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /D "_USRDLL" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\dl_chr.obj"	"$(INTDIR)\dl_chr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "nifplugin1 - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /D "_USRDLL" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

"$(INTDIR)\dl_chr.obj"	"$(INTDIR)\dl_chr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=..\..\..\..\Source\common\dl_err.cpp

!IF  "$(CFG)" == "nifplugin1 - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /D "_USRDLL" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\dl_err.obj"	"$(INTDIR)\dl_err.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "nifplugin1 - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /D "_USRDLL" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

"$(INTDIR)\dl_err.obj"	"$(INTDIR)\dl_err.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=..\..\..\..\Source\common\dl_file.cpp

!IF  "$(CFG)" == "nifplugin1 - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /D "_USRDLL" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\dl_file.obj"	"$(INTDIR)\dl_file.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "nifplugin1 - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /D "_USRDLL" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

"$(INTDIR)\dl_file.obj"	"$(INTDIR)\dl_file.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=..\..\..\..\Source\common\dl_log.cpp

!IF  "$(CFG)" == "nifplugin1 - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /D "_USRDLL" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\dl_log.obj"	"$(INTDIR)\dl_log.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "nifplugin1 - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /D "_USRDLL" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

"$(INTDIR)\dl_log.obj"	"$(INTDIR)\dl_log.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=..\..\..\..\Source\common\dl_math.cpp

!IF  "$(CFG)" == "nifplugin1 - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /D "_USRDLL" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\dl_math.obj"	"$(INTDIR)\dl_math.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "nifplugin1 - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /D "_USRDLL" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

"$(INTDIR)\dl_math.obj"	"$(INTDIR)\dl_math.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=..\..\..\..\Source\common\dl_mem.cpp

!IF  "$(CFG)" == "nifplugin1 - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /D "_USRDLL" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\dl_mem.obj"	"$(INTDIR)\dl_mem.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "nifplugin1 - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /D "_USRDLL" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

"$(INTDIR)\dl_mem.obj"	"$(INTDIR)\dl_mem.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=..\..\..\..\Source\common\dl_str.cpp

!IF  "$(CFG)" == "nifplugin1 - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /D "_USRDLL" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\dl_str.obj"	"$(INTDIR)\dl_str.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "nifplugin1 - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /D "_USRDLL" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

"$(INTDIR)\dl_str.obj"	"$(INTDIR)\dl_str.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=..\..\..\..\Source\common\dl_time.cpp

!IF  "$(CFG)" == "nifplugin1 - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /D "_USRDLL" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\dl_time.obj"	"$(INTDIR)\dl_time.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "nifplugin1 - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /D "_USRDLL" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

"$(INTDIR)\dl_time.obj"	"$(INTDIR)\dl_time.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=..\..\..\..\Source\common\tstfile.cpp

!IF  "$(CFG)" == "nifplugin1 - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /D "_USRDLL" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\tstfile.obj"	"$(INTDIR)\tstfile.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "nifplugin1 - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /D "_USRDLL" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

"$(INTDIR)\tstfile.obj"	"$(INTDIR)\tstfile.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifAlphaProperty.cpp

"$(INTDIR)\NifAlphaProperty.obj"	"$(INTDIR)\NifAlphaProperty.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifAmbientLight.cpp

"$(INTDIR)\NifAmbientLight.obj"	"$(INTDIR)\NifAmbientLight.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifAutoNormalParticles.cpp

"$(INTDIR)\NifAutoNormalParticles.obj"	"$(INTDIR)\NifAutoNormalParticles.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifAutoNormalParticlesData.cpp

"$(INTDIR)\NifAutoNormalParticlesData.obj"	"$(INTDIR)\NifAutoNormalParticlesData.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifBase.cpp

"$(INTDIR)\NifBase.obj"	"$(INTDIR)\NifBase.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifBillboardNode.cpp

"$(INTDIR)\NifBillboardNode.obj"	"$(INTDIR)\NifBillboardNode.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifBsAnimationNode.cpp

"$(INTDIR)\NifBsAnimationNode.obj"	"$(INTDIR)\NifBsAnimationNode.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifBSPArrayController.cpp

"$(INTDIR)\NifBSPArrayController.obj"	"$(INTDIR)\NifBSPArrayController.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifCamera.cpp

"$(INTDIR)\NifCamera.obj"	"$(INTDIR)\NifCamera.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifColorData.cpp

"$(INTDIR)\NifColorData.obj"	"$(INTDIR)\NifColorData.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifDirectionalLight.cpp

"$(INTDIR)\NifDirectionalLight.obj"	"$(INTDIR)\NifDirectionalLight.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifEndFile.cpp

"$(INTDIR)\NifEndFile.obj"	"$(INTDIR)\NifEndFile.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifEOF.cpp

"$(INTDIR)\NifEOF.obj"	"$(INTDIR)\NifEOF.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifFile.cpp

"$(INTDIR)\NifFile.obj"	"$(INTDIR)\NifFile.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifFloatArray.cpp

"$(INTDIR)\NifFloatArray.obj"	"$(INTDIR)\NifFloatArray.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifFloatData.cpp

"$(INTDIR)\NifFloatData.obj"	"$(INTDIR)\NifFloatData.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifGeomMorpherController.cpp

"$(INTDIR)\NifGeomMorpherController.obj"	"$(INTDIR)\NifGeomMorpherController.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifGravity.cpp

"$(INTDIR)\NifGravity.obj"	"$(INTDIR)\NifGravity.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifKeyFrameController.cpp

"$(INTDIR)\NifKeyFrameController.obj"	"$(INTDIR)\NifKeyFrameController.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifKeyFrameData.cpp

"$(INTDIR)\NifKeyFrameData.obj"	"$(INTDIR)\NifKeyFrameData.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifLongArray.cpp

"$(INTDIR)\NifLongArray.obj"	"$(INTDIR)\NifLongArray.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifMaterialProperty.cpp

"$(INTDIR)\NifMaterialProperty.obj"	"$(INTDIR)\NifMaterialProperty.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifMorphData.cpp

"$(INTDIR)\NifMorphData.obj"	"$(INTDIR)\NifMorphData.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifNode.cpp

"$(INTDIR)\NifNode.obj"	"$(INTDIR)\NifNode.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifParticleColorModifier.cpp

"$(INTDIR)\NifParticleColorModifier.obj"	"$(INTDIR)\NifParticleColorModifier.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifParticleGrowFade.cpp

"$(INTDIR)\NifParticleGrowFade.obj"	"$(INTDIR)\NifParticleGrowFade.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifParticleNode.cpp

"$(INTDIR)\NifParticleNode.obj"	"$(INTDIR)\NifParticleNode.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifParticleRotation.cpp

"$(INTDIR)\NifParticleRotation.obj"	"$(INTDIR)\NifParticleRotation.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifParticleSysController.cpp

"$(INTDIR)\NifParticleSysController.obj"	"$(INTDIR)\NifParticleSysController.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifPathController.cpp

"$(INTDIR)\NifPathController.obj"	"$(INTDIR)\NifPathController.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifPixelData.cpp

"$(INTDIR)\NifPixelData.obj"	"$(INTDIR)\NifPixelData.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifPosData.cpp

"$(INTDIR)\NifPosData.obj"	"$(INTDIR)\NifPosData.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifRootCollisionNode.cpp

"$(INTDIR)\NifRootCollisionNode.obj"	"$(INTDIR)\NifRootCollisionNode.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifRotatingParticles.cpp

"$(INTDIR)\NifRotatingParticles.obj"	"$(INTDIR)\NifRotatingParticles.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifRotatingParticlesData.cpp

"$(INTDIR)\NifRotatingParticlesData.obj"	"$(INTDIR)\NifRotatingParticlesData.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifShadeProperty.cpp

"$(INTDIR)\NifShadeProperty.obj"	"$(INTDIR)\NifShadeProperty.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifShortArray.cpp

"$(INTDIR)\NifShortArray.obj"	"$(INTDIR)\NifShortArray.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifSkinData.cpp

"$(INTDIR)\NifSkinData.obj"	"$(INTDIR)\NifSkinData.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifSkinInstance.cpp

"$(INTDIR)\NifSkinInstance.obj"	"$(INTDIR)\NifSkinInstance.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifSourceTexture.cpp

"$(INTDIR)\NifSourceTexture.obj"	"$(INTDIR)\NifSourceTexture.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifStringData.cpp

"$(INTDIR)\NifStringData.obj"	"$(INTDIR)\NifStringData.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifTextKeyExtraData.cpp

"$(INTDIR)\NifTextKeyExtraData.obj"	"$(INTDIR)\NifTextKeyExtraData.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifTextureEffect.cpp

"$(INTDIR)\NifTextureEffect.obj"	"$(INTDIR)\NifTextureEffect.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifTextureProperty.cpp

"$(INTDIR)\NifTextureProperty.obj"	"$(INTDIR)\NifTextureProperty.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifTriShape.cpp

"$(INTDIR)\NifTriShape.obj"	"$(INTDIR)\NifTriShape.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifTriShapeData.cpp

"$(INTDIR)\NifTriShapeData.obj"	"$(INTDIR)\NifTriShapeData.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifUVController.cpp

"$(INTDIR)\NifUVController.obj"	"$(INTDIR)\NifUVController.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifUVData.cpp

"$(INTDIR)\NifUVData.obj"	"$(INTDIR)\NifUVData.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifVertexColorProperty.cpp

"$(INTDIR)\NifVertexColorProperty.obj"	"$(INTDIR)\NifVertexColorProperty.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifVertWeightsExtraData.cpp

"$(INTDIR)\NifVertWeightsExtraData.obj"	"$(INTDIR)\NifVertWeightsExtraData.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifVisController.cpp

"$(INTDIR)\NifVisController.obj"	"$(INTDIR)\NifVisController.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifVisData.cpp

"$(INTDIR)\NifVisData.obj"	"$(INTDIR)\NifVisData.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifWireframeProperty.cpp

"$(INTDIR)\NifWireframeProperty.obj"	"$(INTDIR)\NifWireframeProperty.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\..\Source\uesp\Morrow\NIF\NifZBufferProperty.cpp

"$(INTDIR)\NifZBufferProperty.obj"	"$(INTDIR)\NifZBufferProperty.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\nifplugin1.rc

"$(INTDIR)\nifplugin1.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


SOURCE=.\StdAfx.cpp

!IF  "$(CFG)" == "nifplugin1 - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /D "_USRDLL" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\nifplugin1.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\StdAfx.sbr"	"$(INTDIR)\nifplugin1.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "nifplugin1 - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /D "_USRDLL" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\nifplugin1.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\StdAfx.sbr"	"$(INTDIR)\nifplugin1.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\NifImport.cpp

"$(INTDIR)\NifImport.obj"	"$(INTDIR)\NifImport.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"


SOURCE=.\nifplugin1.cpp

"$(INTDIR)\nifplugin1.obj"	"$(INTDIR)\nifplugin1.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\nifplugin1.pch"



!ENDIF 


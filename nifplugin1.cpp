/*===========================================================================
 *
 * File:	Nifplugin1.CPP
 * Author:	Dave Humphrey (uesp@m0use.net)
 * Created On:	Tuesday, December 23, 2003
 *
 * Description
 *
 *=========================================================================*/

	/* Include Files */
#include "stdafx.h"
#include "nifplugin1.h"
#include "dl_err.h"


/*===========================================================================
 *
 * Begin Local Definitions
 *
 *=========================================================================*/
#ifdef _DEBUG
  #define new DEBUG_NEW 
  #undef THIS_FILE
  static char THIS_FILE[] = __FILE__;
#endif

  CNifplugin1App theApp;
  DEFINE_FILE("NifPlugin1.cpp");
/*===========================================================================
 *		End of Local Definitions
 *=========================================================================*/

//
//	Note!
//
//		If this DLL is dynamically linked against the MFC
//		DLLs, any functions exported from this DLL which
//		call into MFC must have the AFX_MANAGE_STATE macro
//		added at the very beginning of the function.
//
//		For example:
//
//		extern "C" BOOL PASCAL EXPORT ExportedFunction()
//		{
//			AFX_MANAGE_STATE(AfxGetStaticModuleState());
//			// normal function body here
//		}
//
//		It is very important that this macro appear in each
//		function, prior to any calls into MFC.  This means that
//		it must appear as the first statement within the 
//		function, even before any object variable declarations
//		as their constructors may generate calls into the MFC
//		DLL.
//
//		Please see MFC Technical Notes 33 and 58 for additional
//		details.
//


/*===========================================================================
 *
 * Begin CNifPlugin1App Message Map
 *
 *=========================================================================*/
BEGIN_MESSAGE_MAP(CNifplugin1App, CWinApp)
	//{{AFX_MSG_MAP(CNifplugin1App)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()
/*===========================================================================
 *		End of CNifPlugin1App Message Map
 *=========================================================================*/


/*===========================================================================
 *
 * Class CNifplugin1App Constructor
 *
 *=========================================================================*/
CNifplugin1App::CNifplugin1App() {
  SystemLog.Open("nifplugin.log");
 }
/*===========================================================================
 *		End of Class CNifplugin1App Constructor
 *=========================================================================*/



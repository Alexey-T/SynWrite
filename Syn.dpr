{
SynWrite exe project...
}
program Syn;

uses
  FastMM4,
  FastMove,
  FastCode,
  Forms,
  unMainExe in 'unMainExe.pas' {fmSynwrite},
  unMain in 'unMain.pas' {fmMain},
  unAbout in 'unAbout.pas' {fmAbout},
  unFrame in 'unFrame.pas' {EditorFrame: TFrame},
  unSetup in 'unSetup.pas' {fmSetup},
  unSR in 'unSR.pas' {fmSR},
  unSearch in 'unSearch.pas',
  unEnc in 'unEnc.pas' {fmEnc},
  unToolsList in 'unToolsList.pas' {fmTools},
  unToolsOutput in 'unToolsOutput.pas' {fmToolOutput},
  VCLFixes,
  unProgress in 'unProgress.pas' {fmProgress},
  unExtractStr in 'unExtractStr.pas' {fmExtract},
  unClip in 'unClip.pas' {fmClip},
  unProc in 'unProc.pas',
  unShell in 'unShell.pas' {fmShell},
  unInsertText in 'unInsertText.pas' {fmInsTxt},
  unLoadLexStyles in 'unLoadLexStyles.pas' {fmLoadLex},
  unMacroEdit in 'unMacroEdit.pas' {fmMacroEdit},
  unGoto in 'unGoto.pas' {fmGoto},
  unCmds in 'unCmds.pas',
  unMap in 'unMap.pas' {fmMap},
  unSRTree in 'unSRTree.pas' {fmSRTree},
  unSearchInList in 'unSearchInList.pas',
  unProcTabbin in 'unProcTabbin.pas',
  unTabSw in 'unTabSw.pas',
  unTabSwForm in 'unTabSwForm.pas' {fmTabSw},
  unSetupOvr in 'unSetupOvr.pas' {fmSetupOvr},
  unGotoBkmk in 'unGotoBkmk.pas' {fmGotoBkmk},
  unFav in 'unFav.pas' {fmFav},
  unProj in 'unProj.pas' {fmProj},
  unProjAddDir in 'unProjAddDir.pas' {fmProjAddDir: TTntForm},
  unProjProps in 'unProjProps.pas' {fmProjProps: TTntForm},
  unClips in 'unClips.pas' {fmClips},
  unNumConv in 'unNumConv.pas' {fmNumConv: TTntForm},
  ATSynPlugins in 'ATSynPlugins.pas',
  unSort in 'unSort.pas' {fmSort},
  unProcLines in 'unProcLines.pas',
  unMenuCmds in 'unMenuCmds.pas' {fmMenuCmds: TTntForm},
  unMenuProj in 'unMenuProj.pas' {fmMenuProj: TTntForm},
  unInputSimple in 'unInputSimple.pas' {fmInputSimple: TTntForm},
  unInputFilename in 'unInputFilename.pas' {fmInputFilename: TTntForm},
  unInputEx in 'unInputEx.pas' {fmInputEx},
  unInputMemo in 'unInputMemo.pas' {fmInputMemo},
  ATSyntMemo in 'ATSyntMemo.pas',
  unToolbarProp in 'unToolbarProp.pas' {fmToolbarProp: TTntForm},
  unToolbarIcon in 'unToolbarIcon.pas' {fmToolbarIcon: TTntForm},
  unToolbarSize in 'unToolbarSize.pas' {fmToolbarSize: TTntForm},
  unHideItems in 'unHideItems.pas' {fmHideItems},
  unLexerLib in 'unLexerLib.pas' {fmLexerLibrary},
  unProcEditor in 'unProcEditor.pas',
  unProcPy in 'unProcPy.pas',
  unMenuSnippets in 'unMenuSnippets.pas' {fmMenuSnippets: TTntForm},
  unSnipEd in 'unSnipEd.pas' {fmSnippetEditor},
  unMenuPy in 'unMenuPy.pas' {fmMenuPy: TTntForm},
  unSRFiles in 'unSRFiles.pas' {fmSRFiles: TTntForm},
  unMainPy in 'unMainPy.pas',
  unSaveTabs in 'unSaveTabs.pas' {fmSaveTabs},
  unPrintPreview in 'unPrintPreview.pas' {fmPreview},
  unLexerProp in 'unLexerProp.pas',
  unLexerStyles in 'unLexerStyles.pas',
  unPrintSetup in 'unPrintSetup.pas' {fmPrintSetup},
  unMacroCmd in 'unMacroCmd.pas' {fmMacroCmd},
  unInputCheckList in 'unInputCheckList.pas' {fmInputCheckList},
  unLexerImportRules in 'unLexerImportRules.pas' {fmLexerImportRules},
  unLexerItems in 'unLexerItems.pas' {fmLexerItems: TFrame},
  unColorPalette in 'unColorPalette.pas' {fmPalette},
  unProcCustomDialog in 'unProcCustomDialog.pas';

{$R *.res}
{$R *.dkl_const.res}

begin
  if not SynInstanceNeeded then Exit;
  if not SynParamsOK then Exit;
  Application.Initialize;
  Application.Title := 'SynWrite';
  Application.HintHidePause := 5000;
  Application.CreateForm(TfmSynwrite, fmSynwrite);
  Application.CreateForm(TfmPalette, fmPalette);
  //550ms
  Application.Run;
end.

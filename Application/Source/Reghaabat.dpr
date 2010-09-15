program Reghaabat;

uses
  Forms,
  UnitMain in 'UnitMain.pas' {fMain},
  UnitTDE in 'UnitTDE.pas' {F_TDE},
  UnitSetScore in 'UnitSetScore.pas' {fSetScore},
  uCryptography in 'uCryptography.pas',
  uShamsiDate in 'uShamsiDate.pas',
  UnitTarrahReport in 'UnitTarrahReport.pas' {fDesigner},
  UnitResumeTahvil in 'UnitResumeTahvil.pas' {fFreeScore},
  UnitMatchReport in 'UnitMatchReport.pas' {fMatchList},
  UnitDesignBC in 'UnitDesignBC.pas' {fDesignBC},
  UnitDesignWP in 'UnitDesignWP.pas' {fDesignWP},
  UnitLog in 'UnitLog.pas' {fLog},
  UnitTotalReport in 'UnitTotalReport.pas' {fTotalReport},
  UnitChart in 'UnitChart.pas' {fChart},
  UnitNewUser in 'UnitNewUser.pas' {fUser},
  UnitOptions in 'UnitOptions.pas' {fOptions},
  UnitSentence in 'UnitSentence.pas' {F_Sentence},
  UnitExImport in 'UnitExImport.pas' {fImport},
  UnitForm in 'UnitForm.pas' {F_Form},
  UnitAbout in 'UnitAbout.pas' {fAbout},
  UnitWeb in 'UnitWeb.pas' {fWeb},
  UnitMessage in 'UnitMessage.pas' {fMessage},
  Unit1 in 'Unit1.pas' {Form1},
  UnitMaster in 'UnitMaster.pas' {Master};

{Master}

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Reghaabat';
  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TF_TDE, F_TDE);
  //	fMain.SplashScreen.ProgressBar.Position := 100;
{
  Application.CreateForm(TfUser, fUser);
  Application.CreateForm(TF_DesignBC, F_DesignBC);
  Application.CreateForm(TF_MatchReport, F_MatchReport);
  Application.CreateForm(TF_DesignWP, F_DesignWP);
  Application.CreateForm(TF_ExImport, F_ExImport);
  Application.CreateForm(TF_ShowPrize, F_ShowPrize);
  Application.CreateForm(TF_SetScore, F_SetScore);
  Application.CreateForm(TF_TarrahReport, F_TarrahReport);
  Application.CreateForm(TF_ResumeTahvil, F_ResumeTahvil);
  Application.CreateForm(TF_Log, F_Log);
  Application.CreateForm(TF_TotalReport, F_TotalReport);
  Application.CreateForm(TF_Chart, F_Chart);
  Application.CreateForm(TF_Options, F_Options);
  Application.CreateForm(TF_Sentence, F_Sentence);
  Application.CreateForm(TF_PrizeDesign, F_PrizeDesign);
}
  Application.Run;
end.
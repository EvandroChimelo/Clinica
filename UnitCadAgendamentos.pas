unit UnitCadAgendamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Mask, Data.DB, Vcl.Grids, Vcl.DBGrids, Agendamento;

type
  TFormCadAgendamentos = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBComboBox1: TDBComboBox;
    Label7: TLabel;
    DBGrid1: TDBGrid;
    BtnInlcuir: TButton;
    BtnAlterar: TButton;
    BtnSalvar: TButton;
    BtnExcluir: TButton;
    BtnCancelar: TButton;
    EdtGID: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadAgendamentos: TFormCadAgendamentos;

implementation

{$R *.dfm}


end.

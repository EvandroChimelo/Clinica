unit UPessoaModel;

interface

uses
  System.SysUtils,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys.PG,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  UConnection;

type
  TPessoa = class
    private
      FGID: Integer;
      FCPF: string;
      FNome: string;
      FTelefone: string;

    public
      property Gid: Integer read FGID write FGID;
      property CPF: string read FCPF write FCPF;
      property Nome: string read FNome write FNome;
      property Telefone: string read FTelefone write FTelefone;

      constructor Create; overload;
  end;

implementation

constructor TPessoa.Create;
begin
   inherited Create;

end;

end.

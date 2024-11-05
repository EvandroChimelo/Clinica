unit Pessoa;

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
  UConexao;

type
  TPessoa = class(TConnection)
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

      procedure Alterar; virtual;
      procedure Save; virtual;
      procedure excluir; virtual;
      procedure carregar; virtual;

      constructor Create; overload;
  end;

implementation

procedure TPessoa.Alterar;
begin

end;

procedure TPessoa.carregar;
begin

end;

constructor TPessoa.Create;
begin
   inherited Create;

end;

procedure TPessoa.excluir;
begin

end;

procedure TPessoa.Save;
begin

end;

end.

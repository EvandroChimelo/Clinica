unit UMedicosModel;

interface

uses
  System.SysUtils,
  UPessoaModel,
  UMedicoDAO;

type
  TMedicos = class(TPessoa)
    private
      FCRM: string;
      FMedicoQuery: TMedicoQuery;
    public
      property CRM: string read FCRM write FCRM;

      constructor Create;
      destructor Destroy; override;
      procedure Salvar;
      procedure Excluir;
      procedure Editar(AGID: Integer);
      procedure Carregar(GID: Integer);
end;
implementation

procedure TMedicos.Carregar(GID: Integer);
begin

end;

constructor TMedicos.Create;
begin
  inherited Create;
end;

destructor TMedicos.Destroy;
begin
  FMedicoQuery.Free;
  inherited;
end;

procedure TMedicos.Editar(AGID: Integer);
begin
  inherited;

end;

procedure TMedicos.Excluir;
begin
  inherited;
  FMedicoQuery.Excluir(GID);
end;

procedure TMedicos.Salvar;
begin
   // Valida��o b�sica
  if Trim(Nome) = '' then
    raise Exception.Create('O nome � obrigat�rio.');

  if Trim(CPF) = '' then
    raise Exception.Create('O CPF � obrigat�rio.');

  // Persist�ncia delegada � camada de dados
  FMedicoQuery.Salvar(Nome, CPF, Telefone, CRM, Gid);
end;

end.

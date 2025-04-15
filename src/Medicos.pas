unit Medicos;

interface

uses
  System.SysUtils,
  Pessoa, MedicoQuery;

type
  TMedicos = class(TPessoa)
    private
      FCRM: string;
      FMedicoQuery: TMedicoQuery;
    public
      property CRM: string read FCRM write FCRM;

      constructor Create;
      destructor Destroy; override;
      procedure Salvar; override;
      procedure Excluir; override;
      procedure Editar(AGID: Integer); override;
      procedure Carregar(GID: Integer); override;
end;
implementation

procedure TMedicos.Carregar(GID: Integer);
begin

end;

constructor TMedicos.Create;
begin

end;

destructor TMedicos.Destroy;
begin

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

end;

end.

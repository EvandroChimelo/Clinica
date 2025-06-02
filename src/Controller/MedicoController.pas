unit MedicoController;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  FireDAC.Comp.Client, // Para TFDQuery como tipo de retorno para grid
  UMedicosModel,
  UMedicoDAO;

type
  TMedicoController = Class
  private
    FMedicoDAO: TMedicoDAO;

  public
    constructor Create;
    destructor Destroy; override;

    function CarregarMedicosParaGrid: TFDQuery;
  End;


implementation

{ TMedicoController }

function TMedicoController.CarregarMedicosParaGrid: TFDQuery;
begin
  Result := FMedicoDAO.CarregarMedicos;
end;

constructor TMedicoController.Create;
begin
  FMedicoDAO := TMedicoDAO.Create;
end;

destructor TMedicoController.Destroy;
begin
  FreeAndNil(FMedicoDAO);
  inherited;
end;

end.

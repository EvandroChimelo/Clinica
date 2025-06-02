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
      FMedicoQuery: TMedicoDAO;
    public
      property CRM: string read FCRM write FCRM;

end;
implementation

end.

unit UPacienteModel;

interface

uses
  System.SysUtils,
  UPessoaModel;

type
  TPacienteModel = class(TPessoa)
    private
      // Aqui podemos adicionar propriedades específicas para pacientes

    public
//    procedure Carregar(GId:Integer); override;
//    procedure Save; override;
//    procedure Alterar; override;
//    procedure Excluir; override;
//    procedure CarregarListaPaciente;
end;

implementation

{ TPaciente }

//procedure TPacienteModel.Alterar;
//var
//  QueryPaciente: TPacienteDAO;
//begin
//  QueryPaciente := TPacienteDAO.Create(nil);
//  try
//    QueryPaciente.Alterar(Gid, Nome, Telefone, CPF);
//  finally
//    QueryPaciente.Free;
//  end;
//end;

//procedure TPacienteModel.Carregar(GId:Integer);
//var
//  QueryPaciente: TPacienteDAO;
//  LQuery: TFDQuery;
//begin
//  QueryPaciente := TPacienteDAO.Create(nil);
//  try
//    LQuery := QueryPaciente.CarregarPacientesPorId(Gid);
//      if not LQuery.IsEmpty then
//      begin
//      Self.Gid      := LQuery.FieldByName('gid').AsInteger;
//      Self.Nome     := LQuery.FieldByName('nome').AsString;
//      Self.CPF      := LQuery.FieldByName('cpf').AsString;
//      Self.Telefone := LQuery.FieldByName('telefone').AsString;
//      end;
//  finally
//    QueryPaciente.Free;
//  end;
//
//end;
//
//procedure TPacienteModel.CarregarListaPaciente;
//var
//  QueryPaciente: TPacienteDAO;
//begin
//    QueryPaciente := TPacienteDAO.Create(nil);
//  try
//    QueryPaciente.CarregarListaPaciente;
//  finally
//    QueryPaciente.Free;
//  end;
//
//end;
//
//procedure TPacienteModel.Excluir;
//var
//  QueryPaciente: TPacienteDAO;
//begin
//  QueryPaciente := TPacienteDAO.Create(nil);
//  try
//    QueryPaciente.Excluir(Gid);
//  finally
//    QueryPaciente.Free;
//  end;
//end;
//
//procedure TPacienteModel.Save;
//var
//  QueryPaciente: TPacienteDAO;
//  LGID: integer;
//begin
//   QueryPaciente := TPacienteDAO.Create(nil);
//   try
//     LGID := QueryPaciente.Salvar(Nome, Telefone, CPF);
//     Gid := LGID;
//   finally
//     QueryPaciente.Free;
//   end;
//end;

end.

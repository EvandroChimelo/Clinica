unit UEspecialidadeDAO;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, UBaseQuery, UEspecialidadeModel;

type
  TEspecialidadeDAO = class(TBaseQuery)
  public
    constructor create;
    function CarregarEspecialidade: TFDQuery;
    function BuscaEspecialidade(const Nome: string):TFDQuery;
    function CarregarEspecialidadePorId(const AGId: Integer): TEspecialidadeModel;
    function SalvarEspecialidade(AEspecialidade: TEspecialidadeModel): Integer;
    procedure Alterar(const AGid: Integer; const ANome: String);
  end;

implementation

procedure TEspecialidadeDAO.Alterar(const AGid: Integer; const ANome: String);
begin
  with GetQuery do
    begin
      try
        Close;
        SQL.Clear;
        SQL.Text := 'UPDATE ESPECIALIDADE SET NOME = :NOME WHERE GID = :GID';
        ParamByName('Nome').AsString := ANome;
        ExecSQL;

        except
          on e: Exception do
          begin
            raise Exception.Create('Erro ao atualizar Especialidade' + e.Message);
          end;

      end;
    end;
end;

{ TCadEspecialidadeQuery }

function TEspecialidadeDAO.BuscaEspecialidade(const Nome: string): TFDQuery;
begin

end;

function TEspecialidadeDAO.CarregarEspecialidade: TFDQuery;
begin
  with GetQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select gid, nomeespecialidade from especialidade';
      Open;
    end;
    Result := GetQuery;
end;

function TEspecialidadeDAO.CarregarEspecialidadePorId(const AGId: Integer): TEspecialidadeModel;
var
  LQuery: TFDQuery;
begin
  Result := nil;
  LQuery := GetQuery;
  LQuery.Close;
  LQuery.SQL.Clear;
  LQuery.SQL.Text := 'SELECT GID, NOMEESPECIALIDADE FROM ESPECIALIDADE WHERE GID = :GID';
  LQuery.ParamByName('GID').AsInteger := AGId;
  LQuery.Open;
  if not LQuery.IsEmpty then
  begin
    Result := TEspecialidadeModel.Create;
    Result.GIDEspecialidade := LQuery.FieldByName('gid').AsInteger;
    Result.NomeEspecialidade := LQuery.FieldByName('nome').AsString;
  end;

end;

constructor TEspecialidadeDAO.create;
begin
 inherited create;
end;

function TEspecialidadeDAO.SalvarEspecialidade(AEspecialidade: TEspecialidadeModel): Integer;
begin
  with GetQuery do
    begin
      try
        Close;
        SQL.Clear;
        SQL.Text := 'INSERT INTO ESPECIALIDADE (GID, NOMEESPECIALIDADE) VALUES(:GID, :NOMEESPECIALIDADE) RETURNING GID';
        ParamByName('NOMESPECIALIDADE').AsString := AEspecialidade.NomeEspecialidade;

        open;

        Result := FieldByName('GID').AsInteger;
      except
        on E: exception do
          raise Exception.Create('Erro ao Salvar Especialidade: ' + E.Message);

      end;
    end;
end;

end.

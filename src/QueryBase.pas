unit QueryBase;

interface

uses
  System.SysUtils, Firedac.Comp.Client, data.DB, UConexao;

type
  TBaseQuery = class
  private
    FQuery : TFDQuery;
    Fconnection : TConnection;
  public
    constructor Create(AConnection: TConnection); virtual;
    destructor Destroy; override;

    function GetQuery: TFDQuery;
    procedure ExecuteSQL(const ASQL: string);
  end;

implementation

{ TBaseQuery }

constructor TBaseQuery.Create(AConnection: TConnection);
begin
  inherited Create;
  Fconnection := AConnection;

  //Inicializa a TFDQuery e associa á conexão
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := FConnection.GetConnection;
end;

destructor TBaseQuery.Destroy;
begin
  // Libera o recurso do TFDQuery
  FQuery.Free;
  inherited;
end;

procedure TBaseQuery.ExecuteSQL(const ASQL: string);
begin
  //define a SQL e execute a Query
  FQuery.SQL.Text := ASQL;
  FQuery.ExecSQL;

end;

function TBaseQuery.GetQuery: TFDQuery;
begin
  // Retorno a instancia do TFDQuery para uso
  Result := FQuery;
end;

end.

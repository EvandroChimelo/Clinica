unit CadEspecialidadeQuery;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, CadEspecialidade, QueryBase;

type
  TCadEspecialidadeQuery = class(TBaseQuery)
    function CarregarEspecialidade: TFDQuery;
    function BuscaEspecialidade(const Nome: string):TFDQuery;

  end;

implementation

{ TCadEspecialidadeQuery }

function TCadEspecialidadeQuery.BuscaEspecialidade(const Nome: string): TFDQuery;
begin

end;

function TCadEspecialidadeQuery.CarregarEspecialidade: TFDQuery;
begin
  GetQuery.SQL.Text := 'select gid, nomeespecialidade from especialidade';
  GetQuery.Open;
  Result := GetQuery;
end;

end.

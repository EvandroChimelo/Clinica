unit EspecialidadeController;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  FireDAC.Comp.Client,
  UEspecialidadeDAO,
  UEspecialidadeModel;

type
  TEspecialidadeController = class
    private
      FEspecialideDAO: TEspecialidadeDAO;

    public
     constructor Create;
     destructor destroy ; override;

     function CarregarEspecialidadeMedicaParaGrid:TFDQuery;
     function CarregarEspecialidade(AGid: Integer): TEspecialidadeModel;
     function SalvarEspecialidade(AEspecialidade: TEspecialidadeModel): Integer; // Retorna GID salvo/atualizado
     function ExcluirEspecialidade(AGid: Integer): Boolean;

  end;

implementation

{ TEspecialidadeController }

function TEspecialidadeController.CarregarEspecialidade(AGid: Integer): TEspecialidadeModel;
begin
  Result := nil;
  Result := FEspecialideDAO.CarregarEspecialidadePorId(AGId);
end;

function TEspecialidadeController.CarregarEspecialidadeMedicaParaGrid: TFDQuery;
begin
  Result := FEspecialideDAO.CarregarEspecialidade;
end;

constructor TEspecialidadeController.Create;
begin
  FEspecialideDAO := TEspecialidadeDAO.Create;
end;

destructor TEspecialidadeController.destroy;
begin
  FreeAndNil(FEspecialideDAO);
  inherited;
end;

function TEspecialidadeController.ExcluirEspecialidade(AGid: Integer): Boolean;
begin
  Try
    FEspecialideDAO.Excluir(AGid);
    Result := True;
      except
       on E: exception do
       begin
         Result := False;
       end;
  End;
end;

function TEspecialidadeController.SalvarEspecialidade(AEspecialidade: TEspecialidadeModel): Integer;
begin
  Result := 0;

  if AEspecialidade.GIDEspecialidade = 0 then
  begin
    Result := FEspecialideDAO.SalvarEspecialidade(AEspecialidade);
    AEspecialidade.GIDEspecialidade := Result;
  end
  else
  begin
    FEspecialideDAO.Alterar(AEspecialidade.GIDEspecialidade, AEspecialidade.NomeEspecialidade);
    Result := AEspecialidade.GIDEspecialidade;
  end;
end;

end.

unit UEspecialidadeModel;

interface

uses
  System.SysUtils, FireDAC.Comp.Client;


type
  TEspecialidadeModel = Class
  private
    FGID : integer;
    FNomeEspecialidade: string;

  Public
    property GIDEspecialidade:Integer read FGID write FGID;
    property NomeEspecialidade:string Read FNomeEspecialidade write FNomeEspecialidade;

      constructor Create; overload;
  End;

implementation

{ TCadastroEspecialidade }



{ TEspecialidadeModel }

constructor TEspecialidadeModel.Create;
begin
  inherited Create;
end;

end.

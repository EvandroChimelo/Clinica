unit UAgendamentoModel;

interface

type
  TAgendamento = class
  private
    fGID: integer;
    fDataConsulta: TDate;
    fHoraconsulta: TTime;
  public
    property GID: integer read fGID write fGID;
    property DataConsulta: TDate read fDataConsulta write fDataConsulta;
    property HoraConsulta: TTime read fHoraconsulta write fHoraconsulta;

    procedure salvaragendamento;

  end;

implementation

{ TAgendamento }

procedure TAgendamento.salvaragendamento;
begin

end;

end.

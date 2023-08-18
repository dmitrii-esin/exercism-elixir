defmodule LogLevel do
  def to_label(level, legacy?) do
    # Please implement the to_label/2 function
    cond do
      not legacy? and level === 0 -> :trace
      legacy? and level === 0 -> :unknown
      level === 1 -> :debug
      level === 2 -> :info
      level === 3 -> :warning
      level === 4 -> :error
      not legacy? and level === 5 -> :fatal
      legacy? and level === 5 -> :unknown
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    case {to_label(level, legacy?), legacy?} do
      {:error, _} -> :ops
      {:fatal, _} -> :ops
      {:unknown, true} -> :dev1
      {:unknown, false} -> :dev2
      _ -> false
    end
end
end

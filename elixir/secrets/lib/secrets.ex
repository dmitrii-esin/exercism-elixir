defmodule Secrets do
  def secret_add(secret) do
    fn param -> param + secret end
  end

  def secret_subtract(secret) do
    fn param -> param - secret end
  end

  def secret_multiply(secret) do
    fn param -> secret * param end
  end

  def secret_divide(secret) do
    fn param -> trunc(param / secret) end
  end

  def secret_and(secret) do
    fn param -> trunc(Bitwise.band(param, secret)) end
  end

  def secret_xor(secret) do
    # Please implement the secret_xor/1 function
    fn param -> trunc(Bitwise.bxor(param, secret)) end
  end

  def secret_combine(secret_function1, secret_function2) do
    # Please implement the secret_combine/2 function

    fn param ->
      param |> secret_function1.() |> secret_function2.()
    end
  end
end
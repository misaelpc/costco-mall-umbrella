defmodule Mailer.MailerOne do
  def send do
    IO.inspect(self())
    "Email enviado"
  end
end

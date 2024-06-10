defmodule QuantumProject.Repo do
  use Ecto.Repo,
    otp_app: :quantum_project,
    adapter: Ecto.Adapters.MyXQL
end

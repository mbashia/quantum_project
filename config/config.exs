# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :quantum_project,
  ecto_repos: [QuantumProject.Repo]

config :quantum_project, QuantumProject.Scheduler,
  jobs: [
    {"* * * * *", {QuantumProject.Posts, :create_a_post, []}}
    # This job runs every day at midnight
    # {"@daily", {QuantumProject.Posts, :create_a_post, []}}
  ]

# Configures the endpoint
config :quantum_project, QuantumProjectWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: QuantumProjectWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: QuantumProject.PubSub,
  live_view: [signing_salt: "HX8xCJM1"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :quantum_project, QuantumProject.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.12.18",
  default: [
    args: ~w(js/app.js --bundle --target=es2016 --outdir=../priv/static/assets),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"

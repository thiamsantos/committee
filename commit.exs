defmodule Committee.Commit do
  use Committee
  import Committee.Helpers, only: [staged_files: 0, staged_files: 1]

  @impl true
  def pre_commit do
    System.cmd("mix", ["format"] ++ staged_files([".ex", ".exs"]))
    System.cmd("git", ["add"] ++ staged_files())
  end
end

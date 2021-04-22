defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cards.hello()
      :world

  """
  def create_deck do
    ["ACE", "TWO", "THREE"]
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end
end

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
    values = ["ACE", "TWO", "THREE", "FOUR", "FIVE"]
    suits = ["Spades", "Hearts", "Diamonds", "Clubs"]

    cards =
      for value <- values do
        for suit <- suits do
          "#{value} of #{suit}"
        end
      end

    List.flatten(cards)
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end
end

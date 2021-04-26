defmodule Cards do
  @moduledoc """
  Provides methods for creating and handling deck of cards

  """
  @doc """
  returns a list of strings that represents a deck of playing cards
  """
  def create_deck do
    values = ["ACE", "TWO", "THREE", "FOUR", "FIVE"]
    suits = ["Spades", "Hearts", "Diamonds", "Clubs"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Splits deck into and and rest
  The `hand_size` argument indicates how many cards should be in hand
  ## Examples

      iex> deck= Cards.create_deck
      iex> {hand,deck}= Cards.deal(deck,1)
      iex> hand
      ["ACE of Spades"]
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file does not exists"
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end
end

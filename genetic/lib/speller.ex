defmodule Speller do
  @behaviour Problem

  alias Types.Chromasome
  @word "supercalifragilisticexpialidocious"
  @size String.length(@word)

  @impl true
  def genotype do
    genes =
      Stream.repeatedly(fn -> Enum.random(?a..?z) end)
      |> Enum.take(@size)

    %Chromasome{genes: genes, size: @size}
  end

  @impl true
  def fitness_function(chromasome) do
    guess = List.to_string(chromasome.genes)
    String.jaro_distance(@word, guess)
  end

  @impl true
  def terminate?([best | _]), do: best.fitness == 1
end

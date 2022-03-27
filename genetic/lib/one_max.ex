defmodule OneMax do
  @behaviour Problem

  alias Types.Chromasome
  @size 1000

  @impl true
  def genotype do
    genes = for _ <- 1..@size, do: Enum.random(0..1)
    %Chromasome{genes: genes, size: @size}
  end

  @impl true
  def fitness_function(chromasome) do
    Enum.sum(chromasome.genes)
  end

  @impl true
  def terminate?([best | _]), do: best.fitness == @size
end

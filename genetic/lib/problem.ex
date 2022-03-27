defmodule Problem do
  alias Types.Chromosome

  @moduledoc """
  The basic functions for defining a problem in a GA
  """

  @doc """
  returns a Types.Chromasome with an initial set of genes
  """
  @callback genotype :: Chromosome.t()

  @doc """
  Given a Types.Chromasome returns a number() that respresents its fitness for the terminate?/1 to reason about
  """
  @callback fitness_function(Chromosome.t()) :: number()

  @doc """
  given a population, takes the best (head usually) and establishes if its fitness reaches some predicate
  """
  @callback terminate?(Enum.t()) :: boolean()
end

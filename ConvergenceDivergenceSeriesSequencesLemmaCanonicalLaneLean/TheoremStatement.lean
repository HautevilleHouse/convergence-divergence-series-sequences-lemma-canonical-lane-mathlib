import ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean

structure AdmittedObject where
  sequenceType : Type
  convergenceProperty : Prop
  divergenceProperty : Prop
  seriesSummationProperty : Prop
  lemmaBound : Prop
  conclusion : sequenceType → convergenceProperty ∧ divergenceProperty ∧ seriesSummationProperty ∧ lemmaBound

def SequenceWitnessClosed (O : AdmittedObject) : Prop :=
  O.convergenceProperty ∧ O.divergenceProperty ∧ O.seriesSummationProperty ∧ O.lemmaBound

end ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean
end HautevilleHouse
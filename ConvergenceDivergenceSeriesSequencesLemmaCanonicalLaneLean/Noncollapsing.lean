import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean

structure NoncollapsingPackage where
  termBound : Prop
  partialSumCauchy : Prop
  remainderTailControlled : Prop

structure NoncollapsingEvidence (N : NoncollapsingPackage) where
  termBoundClosed : N.termBound
  partialSumCauchyClosed : N.partialSumCauchy
  remainderTailControlledClosed : N.remainderTailControlled

def NoncollapsingClosed (N : NoncollapsingPackage) : Prop :=
  N.termBound ∧ N.partialSumCauchy ∧ N.remainderTailControlled

theorem noncollapsing_closed_from_evidence
    (N : NoncollapsingPackage) (E : NoncollapsingEvidence N) :
    NoncollapsingClosed N := by
  exact And.intro E.termBoundClosed
    (And.intro E.partialSumCauchyClosed E.remainderTailControlledClosed)

end ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean
end HautevilleHouse
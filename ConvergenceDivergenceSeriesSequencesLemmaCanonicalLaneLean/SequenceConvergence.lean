import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean

structure SequenceConvergencePackage where
  limitDefinition : Prop
  epsilonNCharacterization : Prop
  limitUniqueness : Prop
  boundedConvergent : Prop
  monotoneConvergence : Prop

structure SequenceConvergenceEvidence (S : SequenceConvergencePackage) where
  limitDefinitionClosed : S.limitDefinition
  epsilonNCharacterizationClosed : S.epsilonNCharacterization
  limitUniquenessClosed : S.limitUniqueness
  boundedConvergentClosed : S.boundedConvergent
  monotoneConvergenceClosed : S.monotoneConvergence

def SequenceConvergenceClosed (S : SequenceConvergencePackage) : Prop :=
  S.limitDefinition ∧ S.epsilonNCharacterization ∧ S.limitUniqueness ∧
  S.boundedConvergent ∧ S.monotoneConvergence

theorem sequence_convergence_closed_from_evidence (S : SequenceConvergencePackage)
    (E : SequenceConvergenceEvidence S) : SequenceConvergenceClosed S := by
  exact And.intro E.limitDefinitionClosed
    (And.intro E.epsilonNCharacterizationClosed
      (And.intro E.limitUniquenessClosed
        (And.intro E.boundedConvergentClosed E.monotoneConvergenceClosed)))

end ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean.ConvergenceCriteriaPackage

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean

structure SequenceDivergencePackage {C : ConvergenceCriteriaPackage} where
  divergenceDefinition : Prop
  subsequenceDivergence : Prop
  unboundednessTest : Prop
  divergenceDefinitionProof : divergenceDefinition
  subsequenceDivergenceProof : subsequenceDivergence
  unboundednessTestProof : unboundednessTest

structure SequenceDivergenceEvidence {C : ConvergenceCriteriaPackage}
    (D : SequenceDivergencePackage C) where
  divergenceDefinitionClosed : D.divergenceDefinition
  subsequenceDivergenceClosed : D.subsequenceDivergence
  unboundednessTestClosed : D.unboundednessTest

def SequenceDivergenceClosed {C : ConvergenceCriteriaPackage}
    (D : SequenceDivergencePackage C) : Prop :=
  D.divergenceDefinition ∧ D.subsequenceDivergence ∧ D.unboundednessTest

theorem sequence_divergence_closed_from_evidence {C : ConvergenceCriteriaPackage}
    (D : SequenceDivergencePackage C) (E : SequenceDivergenceEvidence D) :
    SequenceDivergenceClosed D := by
  exact And.intro E.divergenceDefinitionClosed
    (And.intro E.subsequenceDivergenceClosed E.unboundednessTestClosed)

end ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean
end HautevilleHouse
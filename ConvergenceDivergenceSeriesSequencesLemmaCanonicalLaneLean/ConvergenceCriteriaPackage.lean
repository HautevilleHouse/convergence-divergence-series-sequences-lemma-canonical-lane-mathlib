import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean

structure ConvergenceCriteriaPackage where
  sequenceType : Type u
  limitType : Type v
  epsilonNdef : Prop
  epsilon : ℚ → ℕ → Prop
  convergenceDefined : Prop

structure ConvergenceCriteriaEvidence (C : ConvergenceCriteriaPackage) where
  epsilonNdefClosed : C.epsilonNdef
  convergenceDefinedClosed : C.convergenceDefined

def ConvergenceCriteriaClosed (C : ConvergenceCriteriaPackage) : Prop :=
  C.epsilonNdef ∧ C.convergenceDefined

theorem convergence_criteria_closed_from_evidence (C : ConvergenceCriteriaPackage)
    (E : ConvergenceCriteriaEvidence C) : ConvergenceCriteriaClosed C := by
  exact And.intro E.epsilonNdefClosed E.convergenceDefinedClosed

end ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean
end HautevilleHouse
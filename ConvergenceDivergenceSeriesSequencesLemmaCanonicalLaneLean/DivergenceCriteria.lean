import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean

structure DivergenceCriteriaPackage where
  termTest : Prop
  nthTermDivergence : Prop
  comparisonDivergence : Prop
  integralDivergence : Prop
  pSeriesDivergence : Prop

structure DivergenceCriteriaEvidence (D : DivergenceCriteriaPackage) where
  termTestClosed : D.termTest
  nthTermDivergenceClosed : D.nthTermDivergence
  comparisonDivergenceClosed : D.comparisonDivergence
  integralDivergenceClosed : D.integralDivergence
  pSeriesDivergenceClosed : D.pSeriesDivergence

def DivergenceCriteriaClosed (D : DivergenceCriteriaPackage) : Prop :=
  D.termTest ∧ D.nthTermDivergence ∧ D.comparisonDivergence ∧
  D.integralDivergence ∧ D.pSeriesDivergence

theorem divergence_criteria_closed_from_evidence (D : DivergenceCriteriaPackage)
    (E : DivergenceCriteriaEvidence D) : DivergenceCriteriaClosed D := by
  exact And.intro E.termTestClosed
    (And.intro E.nthTermDivergenceClosed
      (And.intro E.comparisonDivergenceClosed
        (And.intro E.integralDivergenceClosed E.pSeriesDivergenceClosed)))

end ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean
end HautevilleHouse
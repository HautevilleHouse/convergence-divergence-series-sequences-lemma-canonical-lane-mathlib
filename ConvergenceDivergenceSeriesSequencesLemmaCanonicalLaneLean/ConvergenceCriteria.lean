import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean

structure ConvergenceCriteriaPackage where
  absoluteConvergenceTest : Prop
  ratioTest : Prop
  rootTest : Prop
  comparisonTest : Prop
  alternatingSeriesTest : Prop

structure ConvergenceCriteriaEvidence (C : ConvergenceCriteriaPackage) where
  absoluteConvergenceTestClosed : C.absoluteConvergenceTest
  ratioTestClosed : C.ratioTest
  rootTestClosed : C.rootTest
  comparisonTestClosed : C.comparisonTest
  alternatingSeriesTestClosed : C.alternatingSeriesTest

def ConvergenceCriteriaClosed (C : ConvergenceCriteriaPackage) : Prop :=
  C.absoluteConvergenceTest ∧ C.ratioTest ∧ C.rootTest ∧ C.comparisonTest ∧ C.alternatingSeriesTest

theorem convergence_criteria_closed_from_evidence (C : ConvergenceCriteriaPackage)
    (E : ConvergenceCriteriaEvidence C) : ConvergenceCriteriaClosed C := by
  exact And.intro E.absoluteConvergenceTestClosed
    (And.intro E.ratioTestClosed
      (And.intro E.rootTestClosed
        (And.intro E.comparisonTestClosed E.alternatingSeriesTestClosed)))

end ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean
end HautevilleHouse

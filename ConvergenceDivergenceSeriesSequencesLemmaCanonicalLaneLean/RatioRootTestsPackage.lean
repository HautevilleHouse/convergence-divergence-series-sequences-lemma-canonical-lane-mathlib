import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean.SeriesConvergencePackage

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean

structure RatioRootTestsPackage {C : ConvergenceCriteriaPackage}
    {S : SeriesConvergencePackage C} where
  ratioTest : Prop
  rootTest : Prop
  ratioTestProof : ratioTest
  rootTestProof : rootTest

structure RatioRootTestsEvidence {C : ConvergenceCriteriaPackage}
    {S : SeriesConvergencePackage C} (R : RatioRootTestsPackage C S) where
  ratioTestClosed : R.ratioTest
  rootTestClosed : R.rootTest

def RatioRootTestsClosed {C : ConvergenceCriteriaPackage}
    {S : SeriesConvergencePackage C} (R : RatioRootTestsPackage C S) : Prop :=
  R.ratioTest ∧ R.rootTest

theorem ratio_root_tests_closed_from_evidence {C : ConvergenceCriteriaPackage}
    {S : SeriesConvergencePackage C} (R : RatioRootTestsPackage C S)
    (E : RatioRootTestsEvidence R) : RatioRootTestsClosed R := by
  exact And.intro E.ratioTestClosed E.rootTestClosed

end ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean
end HautevilleHouse
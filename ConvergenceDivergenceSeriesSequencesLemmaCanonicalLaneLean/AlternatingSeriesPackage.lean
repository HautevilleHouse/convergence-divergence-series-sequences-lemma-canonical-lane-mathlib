import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean.SeriesConvergencePackage

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean

structure AlternatingSeriesPackage {C : ConvergenceCriteriaPackage}
    {S : SeriesConvergencePackage C} where
  alternatingSeriesTest : Prop
  absoluteConvergence : Prop
  alternatingSeriesTestProof : alternatingSeriesTest
  absoluteConvergenceProof : absoluteConvergence

structure AlternatingSeriesEvidence {C : ConvergenceCriteriaPackage}
    {S : SeriesConvergencePackage C} (A : AlternatingSeriesPackage C S) where
  alternatingSeriesTestClosed : A.alternatingSeriesTest
  absoluteConvergenceClosed : A.absoluteConvergence

def AlternatingSeriesClosed {C : ConvergenceCriteriaPackage}
    {S : SeriesConvergencePackage C} (A : AlternatingSeriesPackage C S) : Prop :=
  A.alternatingSeriesTest ∧ A.absoluteConvergence

theorem alternating_series_closed_from_evidence {C : ConvergenceCriteriaPackage}
    {S : SeriesConvergencePackage C} (A : AlternatingSeriesPackage C S)
    (E : AlternatingSeriesEvidence A) : AlternatingSeriesClosed A := by
  exact And.intro E.alternatingSeriesTestClosed E.absoluteConvergenceClosed

end ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean
end HautevilleHouse
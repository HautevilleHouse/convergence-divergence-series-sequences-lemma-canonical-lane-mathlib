import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean.SeriesSequenceDefinitions

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean

structure AlternatingSeriesTest where
  series : SeriesSequence
  termsNonincreasing : ∀ n : ℕ, |series.terms (n+1)| ≤ |series.terms n|
  termsTendToZero : Filter.Tendsto series.terms Filter.atTop (𝓝 0)
  alternatingSign : ∀ n : ℕ, series.terms n * series.terms (n+1) ≤ 0

def alternatingSeriesTestCondition (s : SeriesSequence) : Prop :=
  (∀ n : ℕ, |s.terms (n+1)| ≤ |s.terms n|) ∧
  Filter.Tendsto s.terms Filter.atTop (𝓝 0) ∧
  (∀ n : ℕ, s.terms n * s.terms (n+1) ≤ 0)

theorem alternating_series_test_convergence (s : SeriesSequence) (h : alternatingSeriesTestCondition s) : seriesConverges s := by
  sorry

end ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean
end HautevilleHouse

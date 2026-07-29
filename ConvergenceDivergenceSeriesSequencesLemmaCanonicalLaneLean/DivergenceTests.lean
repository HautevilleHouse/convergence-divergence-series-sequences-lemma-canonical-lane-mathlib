import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean.SeriesSequenceDefinitions

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean

structure DivergenceTest where
  series : SeriesSequence
  condition : Prop
  testName : String

structure TermDivergenceTest (s : SeriesSequence) where
  termsNotTendToZero : Filter.Tendsto s.terms Filter.atTop (𝓝 0) → False

def termDivergenceTestCondition (s : SeriesSequence) : Prop :=
  ¬ (Filter.Tendsto s.terms Filter.atTop (𝓝 0))

theorem term_divergence_test_implies_divergence (s : SeriesSequence) (h : termDivergenceTestCondition s) : ¬ seriesConverges s := by
  intro hc
  have : Filter.Tendsto s.terms Filter.atTop (𝓝 0) := by
    have : seriesConverges s := hc
    sorry
  exact h this

end ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean
end HautevilleHouse

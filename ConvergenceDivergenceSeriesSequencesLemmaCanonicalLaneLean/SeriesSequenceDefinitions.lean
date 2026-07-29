import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean

structure SeriesSequence where
  carrier : Type u
  indexSet : ℕ
  terms : ℕ → carrier
  topologicalSpace : TopologicalSpace carrier
  norm : carrier → ℝ

def seriesConverges (s : SeriesSequence) : Prop :=
  ∃ (L : s.carrier), Filter.Tendsto (λ n : ℕ => ∑ i in Finset.range n, s.terms i) Filter.atTop (𝓝 L)

def seriesDiverges (s : SeriesSequence) : Prop := ¬ seriesConverges s

lemma seriesConverges_iff_cauchy (s : SeriesSequence) :
  seriesConverges s ↔ Cauchy (λ n : ℕ => ∑ i in Finset.range n, s.terms i) := by
  exact cauchy_iff_tendsto.symm

structure AdmittedConvergenceObject where
  space : SeriesSequence
  sequenceProperty : Prop
  limitProperty : ∃ L : space.carrier, Filter.Tendsto (λ n : ℕ => space.terms n) Filter.atTop (𝓝 L)
  conclusion : seriesConverges space

end ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean
end HautevilleHouse

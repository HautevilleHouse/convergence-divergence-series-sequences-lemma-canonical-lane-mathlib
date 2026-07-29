import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean

structure SeriesSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure SeriesAdmittedObject where
  series : SeriesSpace
  terms : carrier → ℕ → ℝ
  convergence : Prop
  divergence : Prop
  absoluteConvergence : Prop
  conditionalConvergence : Prop
  conclusion : convergence ∨ divergence

structure SeriesEndgameState where
  object : SeriesAdmittedObject

def SeriesWitnessClosed (O : SeriesAdmittedObject) : Prop :=
  O.conclusion

end ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean
end HautevilleHouse
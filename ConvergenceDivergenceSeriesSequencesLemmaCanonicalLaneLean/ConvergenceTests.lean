import HautevilleHouse.ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean

structure SeriesSequenceDomain where
  termType : Type u
  indexSet : Type v
  norm : termType → ℝ
  indexOrder : indexSet → indexSet → Prop
  normNonnegative : ∀ x : termType, norm x ≥ 0
  indexOrderReflexive : ∀ i : indexSet, indexOrder i i

def seriesSummation (dom : SeriesSequenceDomain) (terms : dom.indexSet → dom.termType) (n : dom.indexSet) : ℝ :=
  ∑ i in Finset.filter (λ j => dom.indexOrder j n) (Finset.univ : Finset dom.indexSet), dom.norm (terms i)

structure ConvergenceTestPackage (dom : SeriesSequenceDomain) where
  testName : String
  testCondition : (dom.indexSet → dom.termType) → Prop
  convergenceImplication : ∀ (terms : dom.indexSet → dom.termType), testCondition terms → ∃ (N : dom.indexSet), ∀ (n : dom.indexSet), dom.indexOrder N n → seriesSummation dom terms n < ∞

structure RatioTestPackage (dom : SeriesSequenceDomain) extends ConvergenceTestPackage dom where
  ratioLimit : (dom.indexSet → dom.termType) → ℝ
  ratioLessThanOne : ∀ (terms : dom.indexSet → dom.termType), ratioLimit terms < 1

structure RootTestPackage (dom : SeriesSequenceDomain) extends ConvergenceTestPackage dom where
  rootLimit : (dom.indexSet → dom.termType) → ℝ
  rootLessThanOne : ∀ (terms : dom.indexSet → dom.termType), rootLimit terms < 1

end ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean
end HautevilleHouse
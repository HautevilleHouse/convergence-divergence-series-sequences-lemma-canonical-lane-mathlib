import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean

structure SeriesSequenceObject where
  seriesOrSequence : Type
  termProperty : Prop
  limitOrSum : Prop
  conclusion : limitOrSum

structure ConvergentAdmittedObject where
  object : SeriesSequenceObject
  bridgeCondition : Prop
  gateCondition : Prop

end ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean
end HautevilleHouse
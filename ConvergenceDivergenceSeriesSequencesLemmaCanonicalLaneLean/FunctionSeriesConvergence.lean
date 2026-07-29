import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean

structure FunctionSeriesConvergencePackage where
  pointwiseConvergence : Prop
  uniformConvergence : Prop
  weierstrassMTest : Prop
  uniformLimitContinuous : Prop
  termwiseIntegration : Prop

structure FunctionSeriesConvergenceEvidence (F : FunctionSeriesConvergencePackage) where
  pointwiseConvergenceClosed : F.pointwiseConvergence
  uniformConvergenceClosed : F.uniformConvergence
  weierstrassMTestClosed : F.weierstrassMTest
  uniformLimitContinuousClosed : F.uniformLimitContinuous
  termwiseIntegrationClosed : F.termwiseIntegration

def FunctionSeriesConvergenceClosed (F : FunctionSeriesConvergencePackage) : Prop :=
  F.pointwiseConvergence ∧ F.uniformConvergence ∧ F.weierstrassMTest ∧
  F.uniformLimitContinuous ∧ F.termwiseIntegration

theorem function_series_convergence_closed_from_evidence
    (F : FunctionSeriesConvergencePackage)
    (E : FunctionSeriesConvergenceEvidence F) : FunctionSeriesConvergenceClosed F := by
  exact And.intro E.pointwiseConvergenceClosed
    (And.intro E.uniformConvergenceClosed
      (And.intro E.weierstrassMTestClosed
        (And.intro E.uniformLimitContinuousClosed E.termwiseIntegrationClosed)))

end ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean
end HautevilleHouse
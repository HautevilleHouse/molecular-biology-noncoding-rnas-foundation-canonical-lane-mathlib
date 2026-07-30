import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean

structure NoncodingRnaTranscriptomicsPackage where
  cellType : Type u
  totalRna : Type v
  smallRnasFraction : Prop
  mrnaFraction : Prop
  noncodingRnasFraction : Prop
  expressionLevelsReproducible : Prop
  smallRnasFractionClosed : smallRnasFraction
  mrnaFractionClosed : mrnaFraction
  noncodingRnasFractionClosed : noncodingRnasFraction
  expressionLevelsReproducibleClosed : expressionLevelsReproducible

structure NoncodingRnaTranscriptomicsEvidence (P : NoncodingRnaTranscriptomicsPackage) where
  smallRnasFractionClosed : P.smallRnasFraction
  mrnaFractionClosed : P.mrnaFraction
  noncodingRnasFractionClosed : P.noncodingRnasFraction
  expressionLevelsReproducibleClosed : P.expressionLevelsReproducible

def NoncodingRnaTranscriptomicsClosed (P : NoncodingRnaTranscriptomicsPackage) : Prop :=
  P.smallRnasFraction ∧ P.mrnaFraction ∧ P.noncodingRnasFraction ∧ P.expressionLevelsReproducible

theorem noncoding_rna_transcriptomics_closed_from_evidence
    (P : NoncodingRnaTranscriptomicsPackage) (E : NoncodingRnaTranscriptomicsEvidence P) :
    NoncodingRnaTranscriptomicsClosed P := by
  exact And.intro E.smallRnasFractionClosed
    (And.intro E.mrnaFractionClosed
      (And.intro E.noncodingRnasFractionClosed E.expressionLevelsReproducibleClosed))

end MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean
end HautevilleHouse

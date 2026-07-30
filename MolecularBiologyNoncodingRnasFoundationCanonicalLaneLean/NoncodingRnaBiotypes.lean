import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean

structure NoncodingRnaBiotype where
  biotypeName : String
  lengthRange : Nat × Nat
  biogenesisPathway : String
  molecularFunction : String
  cellularLocalization : String

structure NoncodingRnaBiotypesPackage where
  microrna : NoncodingRnaBiotype
  lncrna : NoncodingRnaBiotype
  circrna : NoncodingRnaBiotype
  pirna : NoncodingRnaBiotype
  snorna : NoncodingRnaBiotype
  trna : NoncodingRnaBiotype

structure NoncodingRnaBiotypesEvidence (P : NoncodingRnaBiotypesPackage) where
  micrornaDefined : P.microrna.biotypeName = "miRNA"
  lncrnaDefined : P.lncrna.biotypeName = "lncRNA"
  circrnaDefined : P.circrna.biotypeName = "circRNA"
  pirnaDefined : P.pirna.biotypeName = "piRNA"
  snornaDefined : P.snorna.biotypeName = "snoRNA"
  trnaDefined : P.trna.biotypeName = "tRNA"

def NoncodingRnaBiotypesClosed (P : NoncodingRnaBiotypesPackage) : Prop :=
  P.microrna.biotypeName = "miRNA" ∧
  P.lncrna.biotypeName = "lncRNA" ∧
  P.circrna.biotypeName = "circRNA" ∧
  P.pirna.biotypeName = "piRNA" ∧
  P.snorna.biotypeName = "snoRNA" ∧
  P.trna.biotypeName = "tRNA"

theorem noncoding_rna_biotypes_closed_from_evidence
    (P : NoncodingRnaBiotypesPackage) (E : NoncodingRnaBiotypesEvidence P) :
    NoncodingRnaBiotypesClosed P := by
  exact And.intro E.micrornaDefined
    (And.intro E.lncrnaDefined
      (And.intro E.circrnaDefined
        (And.intro E.pirnaDefined
          (And.intro E.snornaDefined E.trnaDefined))))

end MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean
end HautevilleHouse
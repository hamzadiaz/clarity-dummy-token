(impl-trait 'ST1X6M947Z7E58CNE0H8YJVJTVKS9VW0PHEG3NHN3.ft-trait.sip-010-trait)

(define-fungible-token dummy-token)

;; get the token balance of owner
(define-read-only (get-balance (owner principal))
  (begin
    (ok (ft-get-balance dummy-token owner))))

;; returns the total number of tokens (avoid constants)
(define-read-only (get-total-supply)
  (ok (ft-get-supply dummy-token)))

;; returns the token name
(define-read-only (get-name)
  (ok "Dummy Token"))

;; the symbol or "ticker" for this token
(define-read-only (get-symbol)
  (ok "DUM"))

;; the number of decimals used
(define-read-only (get-decimals)
  (ok u0)) ;; 0 decimals

;; Transfers tokens to a recipient
(define-public (transfer (amount uint) (sender principal) (recipient principal) (memo (optional (buff 34))))
  (if (is-eq tx-sender sender)
    (begin
      (try! (ft-transfer? dummy-token amount sender recipient))
      (print memo)
      (ok true)
    )
    (err u4)))

(define-public (get-token-uri)
  (ok (some u"https://example.com")))

(define-public (faucet)
  (ok (ft-mint? dummy-token u1000 tx-sender))
)

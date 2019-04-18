let greeting =
  Alcotest.testable
    (fun ppf greeting -> Format.fprintf ppf "%s" (Lib.show_greeting greeting))
    (Lib.equal_greeting)

let check_hello g (who:string) () =
  Alcotest.check greeting "same greeting" g (Lib.Hello who)

let hello_tests = List.map
  (fun (desc, expected, name) -> (desc, `Quick, check_hello expected name))
  [
    ("Hello foo should work", Lib.Hello "foo", "foo");
    ("Hello baz should work", Lib.Hello "bar", "baz");
  ]

let () =
  Alcotest.run "All Tests" [
    "hello tests", hello_tests;
  ]

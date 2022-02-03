defmodule FaturaTest do
  use ExUnit.Case
  doctest Invoices

  test "should create an invoices list" do
    invoices = Invoices.create_invoices(["water", "light"], [5, 10])

    assert invoices == [
             "Invoice: water expire on 5",
             "Invoice: water expire on 10",
             "Invoice: light expire on 5",
             "Invoice: light expire on 10"
           ]
  end

  test "should return a ordered list of invoices" do
    invoices = Invoices.order_invoices(["water", "light", "phone"])
    refute invoices == ["water", "light", "phone"]
  end

  test "should return if invoice exists" do
    invoice =
      Invoices.invoice_exist?(Invoices.create_invoices(["water", "light"], [5, 10]), "water")

    assert invoice == true
  end

  test "should return a splited list" do
    {splited, others} = Invoices.invoices_to_pay(Invoices.create_invoices(["water", "light"], [5, 10]), 1)

    assert splited == ["Invoice: water expire on 5"]

    assert Enum.count(splited) == 1
    assert Enum.count(others) == 3
  end
end

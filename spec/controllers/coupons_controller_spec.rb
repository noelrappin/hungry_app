require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe CouponsController do

  # This should return the minimal set of attributes required to create a valid
  # Coupon. As you add validations to Coupon, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "restaurant_id" => "1" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CouponsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all coupons as @coupons" do
      coupon = Coupon.create! valid_attributes
      get :index, {}, valid_session
      assigns(:coupons).should eq([coupon])
    end
  end

  describe "GET show" do
    it "assigns the requested coupon as @coupon" do
      coupon = Coupon.create! valid_attributes
      get :show, {:id => coupon.to_param}, valid_session
      assigns(:coupon).should eq(coupon)
    end
  end

  describe "GET new" do
    it "assigns a new coupon as @coupon" do
      get :new, {}, valid_session
      assigns(:coupon).should be_a_new(Coupon)
    end
  end

  describe "GET edit" do
    it "assigns the requested coupon as @coupon" do
      coupon = Coupon.create! valid_attributes
      get :edit, {:id => coupon.to_param}, valid_session
      assigns(:coupon).should eq(coupon)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Coupon" do
        expect {
          post :create, {:coupon => valid_attributes}, valid_session
        }.to change(Coupon, :count).by(1)
      end

      it "assigns a newly created coupon as @coupon" do
        post :create, {:coupon => valid_attributes}, valid_session
        assigns(:coupon).should be_a(Coupon)
        assigns(:coupon).should be_persisted
      end

      it "redirects to the created coupon" do
        post :create, {:coupon => valid_attributes}, valid_session
        response.should redirect_to(Coupon.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved coupon as @coupon" do
        # Trigger the behavior that occurs when invalid params are submitted
        Coupon.any_instance.stub(:save).and_return(false)
        post :create, {:coupon => { "restaurant_id" => "invalid value" }}, valid_session
        assigns(:coupon).should be_a_new(Coupon)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Coupon.any_instance.stub(:save).and_return(false)
        post :create, {:coupon => { "restaurant_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested coupon" do
        coupon = Coupon.create! valid_attributes
        # Assuming there are no other coupons in the database, this
        # specifies that the Coupon created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Coupon.any_instance.should_receive(:update_attributes).with({ "restaurant" => "" })
        put :update, {:id => coupon.to_param, :coupon => { "restaurant" => "" }}, valid_session
      end

      it "assigns the requested coupon as @coupon" do
        coupon = Coupon.create! valid_attributes
        put :update, {:id => coupon.to_param, :coupon => valid_attributes}, valid_session
        assigns(:coupon).should eq(coupon)
      end

      it "redirects to the coupon" do
        coupon = Coupon.create! valid_attributes
        put :update, {:id => coupon.to_param, :coupon => valid_attributes}, valid_session
        response.should redirect_to(coupon)
      end
    end

    describe "with invalid params" do
      it "assigns the coupon as @coupon" do
        coupon = Coupon.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Coupon.any_instance.stub(:save).and_return(false)
        put :update, {:id => coupon.to_param, :coupon => { "restaurant_id" => "invalid value" }}, valid_session
        assigns(:coupon).should eq(coupon)
      end

      it "re-renders the 'edit' template" do
        coupon = Coupon.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Coupon.any_instance.stub(:save).and_return(false)
        put :update, {:id => coupon.to_param, :coupon => { "restaurant_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested coupon" do
      coupon = Coupon.create! valid_attributes
      expect {
        delete :destroy, {:id => coupon.to_param}, valid_session
      }.to change(Coupon, :count).by(-1)
    end

    it "redirects to the coupons list" do
      coupon = Coupon.create! valid_attributes
      delete :destroy, {:id => coupon.to_param}, valid_session
      response.should redirect_to(coupons_url)
    end
  end

end
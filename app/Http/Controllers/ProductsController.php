<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Controllers\Controller;
//use TCG\Voyager\Models\Post;
use App\Product;
class ProductsController extends Controller
{
    //metodo index

    public function index(){

       // 
       $posts = Product::paginate();


        return view('policy', compact('posts'));
    }

    public function show(Product $posts){

        return view('products.show', compact('posts'));    
    
    }
}

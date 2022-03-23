import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http'
import { Observable } from 'rxjs';
import { Foo } from '../model/foo';


@Injectable({
  providedIn: 'root'
})
export class FooService {
  
  fooURL = "http://localhost:8090/foo/"
  httpOptions = { headers : new HttpHeaders ({'Content-Type':'application/json'})};

  constructor(private httpClient: HttpClient) { }

  public list(): Observable<Foo[]> {
    return this.httpClient.get<Foo[]>(this.fooURL, this.httpOptions);
  } 

  public detail(id: number): Observable<Foo> {
    return this.httpClient.get<Foo>(this.fooURL + `${id}` , this.httpOptions);
  }
}
